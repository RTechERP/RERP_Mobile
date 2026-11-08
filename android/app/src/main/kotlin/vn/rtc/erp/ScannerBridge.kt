package vn.rtc.erp

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Binder
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.IInterface
import android.os.Looper
import android.os.Parcel
import android.util.Log
import android.view.KeyEvent
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import java.lang.reflect.Method

/**
 * Bridge kết nối tới phần cứng quét mã của máy PDA Mobydata M93.
 *
 * Ba nút quét vật lý của máy có scanCode gốc là 315 / 310 / 311 (xem
 * `/system/usr/keylayout/gpio-keys.kl`). Sau khi hệ thống remap keymap, chúng
 * đến app dưới dạng `keyCode = KEYCODE_BARCODE` (1003) kèm `scanCode` gốc.
 *
 * Cơ chế hoạt động:
 * - `KeyboardManager.disableInterception(true)` cho phép phím quét đi tới app
 *   thay vì bị `PhoneWindowManager` hấp thụ. Sau khi tắt hấp thụ, framework
 *   không tự kích hoạt đầu đọc nên app phải tự gọi `pressTrigger()`.
 * - Kết quả đọc mã nhận qua listener `IReadActionListener` của service
 *   `scanner`, và qua broadcast của wedge với action
 *   `com.android.decodewedge.decode_action`.
 *
 * Flutter lắng nghe qua EventChannel `vn.rtc.erp/scanner`.
 */
class ScannerBridge(private val context: Context, messenger: BinaryMessenger) {

    companion object {
        // Tag dùng để lọc log khi debug trên máy thật: `adb logcat -s PDAScanner`.
        const val TAG = "PDAScanner"

        // Channel báo sự kiện quét lên Flutter.
        private const val SCANNER_CHANNEL = "vn.rtc.erp/scanner"

        // Tên system service của lõi máy quét (`IScannerServiceCore`).
        private const val CORE_SERVICE = "int3rn4lC4ptur3"

        // Tên system service của SDK máy quét (`IScannerService`).
        private const val SDK_SERVICE = "scanner"

        // Descriptor của interface `IScannerServiceCore`.
        private const val DESCRIPTOR_CORE =
            "com.android.interfaces.scanner.server.IScannerServiceCore"

        // Descriptor của interface `IScannerService`.
        private const val DESCRIPTOR_SDK =
            "com.android.interfaces.scanner.sdk.server.IScannerService"

        // Descriptor của interface `IReadActionListener`.
        private const val DESCRIPTOR_READ_LISTENER =
            "com.android.interfaces.scanner.sdk.decode.IReadActionListener"

        // Lớp quản lý bàn phím của máy PDA, dùng để tắt hấp thụ phím.
        private const val KEYBOARD_MANAGER_CLASS = "com.android.device.input.KeyboardManager"

        // Giao dịch `pressTrigger()` — bật đầu đọc mã.
        private const val CORE_PRESS_TRIGGER = 1

        // Giao dịch `releaseTrigger()` — tắt đầu đọc mã.
        private const val CORE_RELEASE_TRIGGER = 2

        // Giao dịch `setFocused(boolean)` — báo máy biết app đang có tiêu điểm.
        private const val CORE_SET_FOCUSED = 3

        // Giao dịch `addReadActionListener(...)`.
        private const val SDK_ADD_READ_LISTENER = 6

        // Giao dịch `commitProperties()` — áp dụng các thuộc tính vừa đặt.
        private const val SDK_COMMIT_PROPERTIES = 17

        // Giao dịch `setPropertyInt(int, int)`.
        private const val SDK_SET_PROPERTY_INT = 19

        // Giao dịch `setPropertyString(int, String)`.
        private const val SDK_SET_PROPERTY_STRING = 21

        // Giao dịch `getPropertyInt(int)`.
        private const val SDK_GET_PROPERTY_INT = 23

        // Giao dịch `onBarcodeDataReceived(String, int, byte[])` của listener.
        private const val READ_ON_BARCODE_DATA = 1

        // ----- Thuộc tính của máy quét (PropertyID) -----
        // Định danh lấy từ `com.android.decode.PropertyID` trong
        // `/system/framework/com.android.device.jar` của máy.

        // `ILLUM_MODE` — màu LED chiếu sáng: 1 = trắng, 2 = đỏ, 4 = xanh.
        //
        // Đây là bitmask chọn màu chứ không phải công tắc bật/tắt. Đặt 0 sẽ
        // bị máy bỏ qua, nên đèn được tắt bằng
        // [PROP_SET_CONTROL_ILLULEVEL].
        private const val PROP_ILLUM_MODE = 4

        // `SET_CONTROL_ILLULEVEL` — mức sáng của đèn chiếu sáng.
        //
        // Máy M93 nhận giá trị 1..20 cho các mức sáng, 128 cho chế độ tự
        // động và 512 cho trạng thái tắt (xem mảng
        // `illumination_brightness_values` của app ScanSettings của máy).
        private const val PROP_SET_CONTROL_ILLULEVEL = 327713

        // Giá trị của [PROP_SET_CONTROL_ILLULEVEL] tương ứng với đèn tắt.
        private const val ILLUM_LEVEL_OFF = 512

        // `AUTO_SCAN_ENABLE` — quét liên tục.
        private const val PROP_AUTO_SCAN_ENABLE = 98

        // `WEDGE_KEYBOARD_ENABLE` — gõ ký tự vào app.
        private const val PROP_WEDGE_KEYBOARD_ENABLE = 70000

        // `WEDGE_INTENT_ENABLE` — gửi kết quả bằng broadcast.
        private const val PROP_WEDGE_INTENT_ENABLE = 200000

        // `WEDGE_INTENT_ACTION_NAME` — action của broadcast.
        private const val PROP_WEDGE_INTENT_ACTION_NAME = 200001

        // `WEDGE_INTENT_CATEGORY_NAME` — category của broadcast.
        private const val PROP_WEDGE_INTENT_CATEGORY_NAME = 200002

        // `WEDGE_INTENT_DELIVERY_MODE` — cách gửi kết quả.
        private const val PROP_WEDGE_INTENT_DELIVERY_MODE = 200003

        // Chế độ gửi kết quả của wedge: `BROADCAST`.
        // Thứ tự của enum `IntentDeliveryMode` trong
        // `com.android.decode.configuration` của máy:
        // START_ACTIVITY = 0, START_SERVICE = 1, BROADCAST = 2.
        private const val INTENT_DELIVERY_MODE_BROADCAST = 2

        /**
         * ScanCode gốc của 3 nút quét vật lý trên M93.
         *
         * Lấy từ `/system/usr/keylayout/gpio-keys.kl` của máy: 315 là nút K1,
         * 310 và 311 là hai nút quét trái/phải.
         */
        private val SCAN_TRIGGER_SCAN_CODES = setOf(315, 310, 311, 522)

        /**
         * Keycode mà hệ thống remap cả 3 nút quét về cùng.
         *
         * `KEYCODE_BARCODE` là key ẩn của AOSP nên không có trong public SDK.
         */
        private const val KEYCODE_BARCODE = 1003

        // Action/category mặc định của broadcast kết quả quét mã trên M93.
        private const val DEFAULT_DECODE_ACTION = "com.android.decodewedge.decode_action"
        private const val DEFAULT_DECODE_CATEGORY = "com.android.decodewedge.decode_category"

        // Extra chứa nội dung mã đọc được.
        private const val EXTRA_BARCODE_STRING =
            "com.android.decode.intentwedge.barcode_string"
        private const val EXTRA_BARCODE_TYPE =
            "com.android.decode.intentwedge.barcode_type"
    }

    private val eventChannel = EventChannel(messenger, SCANNER_CHANNEL)
    private var receiver: BroadcastReceiver? = null
    private var coreService: IBinder? = null
    private var sdkService: IBinder? = null

    /** EventSink hiện tại — dùng để gửi cả kết quả quét lẫn sự kiện nút quét. */
    private var sink: EventChannel.EventSink? = null

    // Handler của main thread.
    //
    // Listener của SDK máy quét gọi callback trên binder thread, còn
    // `EventSink` của Flutter bắt buộc phải gọi trên main thread. Nên mọi
    // event đẩy lên Flutter đều phải chuyển qua handler này.
    private val mainHandler = Handler(Looper.getMainLooper())

    // Mã vừa đọc được và lần quét tương ứng, dùng để chặn trùng.
    //
    // Kết quả có thể đến từ cả listener của SDK lẫn broadcast của wedge,
    // nên cùng một lần quét có thể được báo hai lần. Chỉ chặn trùng
    // trong cùng một lần bấm nút — quét lại cùng mã ở lần bấm sau vẫn
    // được báo bình thường.
    private var lastScanText: String? = null
    private var lastScanSession: Int = -1

    // Đếm số lần bấm nút quét, dùng làm mã định danh cho một lần quét.
    private var scanSession: Int = 0

    /**
     * Bắt đầu lắng nghe kết quả quét. Gọi 1 lần khi app khởi động.
     */
    fun start() {
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                sink = events
            }

            override fun onCancel(arguments: Any?) {
                sink = null
            }
        })

        registerReceiver()
        disableSystemInterception()
        connect()
        addReadListener()
        configureSingleShotIntentWedge(DEFAULT_DECODE_ACTION, DEFAULT_DECODE_CATEGORY)
    }

    /**
     * Tắt cơ chế framework hệ thống hấp thụ phím của máy PDA.
     *
     * Trên M93, `PhoneWindowManager` chặn các phím quét mã trước khi chúng tới
     * app. Sau khi tắt hấp thụ, các phím này đi tiếp xuống app và app tự
     * kích hoạt đầu đọc bằng [pressTrigger].
     */
    private fun disableSystemInterception() {
        try {
            val keyboardManagerClass = Class.forName(KEYBOARD_MANAGER_CLASS)
            val manager = keyboardManagerClass.getDeclaredConstructor().newInstance()
            val method: Method = keyboardManagerClass.getMethod(
                "disableInterception",
                Boolean::class.javaPrimitiveType
            )
            method.invoke(manager, true)
            Log.i(TAG, "đã tắt hấp thụ phím của hệ thống")
        } catch (e: Throwable) {
            val cause = generateSequence(e.cause) { it.cause }.lastOrNull() ?: e
            Log.w(TAG, "không tắt được hấp thụ phím: ${cause.javaClass.name}")
        }
    }

    /**
     * Kết nối tới lõi máy quét và báo cho máy biết app đang có tiêu điểm.
     */
    private fun connect() {
        val binder = getSystemServiceBinder(CORE_SERVICE) ?: run {
            Log.w(TAG, "không tìm thấy service '$CORE_SERVICE'")
            return
        }
        coreService = binder

        transactVoid(CORE_SET_FOCUSED, DESCRIPTOR_CORE) { parcel -> parcel.writeInt(1) }
        Log.i(TAG, "đã kết nối lõi máy quét")
    }

    /**
     * Đăng ký listener nhận kết quả đọc mã trực tiếp từ đầu quét của máy.
     *
     * Listener được viết bằng `Binder` thuần vì interface của máy nằm trong
     * thư viện mà app không compile được.
     */
    private fun addReadListener() {
        val binder = getSystemServiceBinder(SDK_SERVICE) ?: run {
            Log.w(TAG, "không tìm thấy service '$SDK_SERVICE'")
            return
        }
        sdkService = binder

        val readListener = object : Binder(), IInterface {
            override fun asBinder(): IBinder = this

            override fun onTransact(
                code: Int,
                data: Parcel,
                reply: Parcel?,
                flags: Int
            ): Boolean {
                if (code != READ_ON_BARCODE_DATA) {
                    return super.onTransact(code, data, reply, flags)
                }
                data.enforceInterface(DESCRIPTOR_READ_LISTENER)
                val text = data.readString().orEmpty()
                val type = data.readInt()
                data.createByteArray()
                if (text.isNotEmpty()) {
                    Log.i(TAG, "đọc được mã '$text' (loại $type)")
                    emitScan(text, type.toString())
                }
                return true
            }
        }

        val data = Parcel.obtain()
        val reply = Parcel.obtain()
        val ok = try {
            data.writeInterfaceToken(DESCRIPTOR_SDK)
            data.writeStrongBinder(readListener)
            binder.transact(SDK_ADD_READ_LISTENER, data, reply, 0)
            reply.readException()
            reply.readInt() == 0
        } catch (e: Throwable) {
            Log.w(TAG, "lỗi đăng ký read listener: ${e.message}")
            false
        } finally {
            data.recycle()
            reply.recycle()
        }
        Log.i(TAG, "đăng ký listener đọc mã=$ok")
    }

    /**
     * Cấu hình máy quét để chỉ gửi kết quả bằng broadcast, không gõ ký tự
     * vào app và không quét liên tục.
     *
     * Chỉ có một chế độ hoạt động tại một thời điểm: nếu bật gõ ký tự thì
     * kết quả quét được gõ thẳng vào ô nhập và app sẽ không nhận được.
     */
    private fun configureSingleShotIntentWedge(action: String, category: String) {
        val binder = sdkService ?: return

        // Tắt gõ ký tự: kết quả phải đến app qua broadcast.
        setPropertyInt(PROP_WEDGE_KEYBOARD_ENABLE, 0)

        // Tắt quét liên tục: chỉ quét khi có lệnh trigger.
        setPropertyInt(PROP_AUTO_SCAN_ENABLE, 0)

        // Action và category của broadcast kết quả.
        setPropertyString(PROP_WEDGE_INTENT_ACTION_NAME, action)
        setPropertyString(PROP_WEDGE_INTENT_CATEGORY_NAME, category)

        // Cách gửi kết quả: broadcast (không start activity/service).
        setPropertyInt(PROP_WEDGE_INTENT_DELIVERY_MODE, INTENT_DELIVERY_MODE_BROADCAST)

        // Bật chế độ gửi broadcast.
        setPropertyInt(PROP_WEDGE_INTENT_ENABLE, 1)

        // Tắt đèn chiếu sáng (đèn trắng) của đầu quét: chỉ dùng tia laser
        // ngắm mã, không làm chói màn hình khi quét.
        disableIllumination()

        // Áp dụng các thay đổi.
        transactInt(SDK_COMMIT_PROPERTIES, DESCRIPTOR_SDK, binder) {}
        Log.i(TAG, "wedge action='$action' category='$category'")
    }

    /**
     * Bật/tắt một thuộc tính số của máy quét.
     */
    private fun setPropertyInt(propertyId: Int, value: Int) {
        val binder = sdkService ?: return
        val result = transactInt(SDK_SET_PROPERTY_INT, DESCRIPTOR_SDK, binder) { parcel ->
            parcel.writeInt(propertyId)
            parcel.writeInt(value)
        }
        Log.i(TAG, "setPropertyInt($propertyId, $value) -> $result")
    }

    /**
     * Đặt một thuộc tính chuỗi của máy quét.
     */
    private fun setPropertyString(propertyId: Int, value: String) {
        val binder = sdkService ?: return
        val result = transactInt(SDK_SET_PROPERTY_STRING, DESCRIPTOR_SDK, binder) { parcel ->
            parcel.writeInt(propertyId)
            parcel.writeString(value)
        }
        Log.i(TAG, "setPropertyString($propertyId, $value) -> $result")
    }

    /**
     * Đọc giá trị hiện tại của một thuộc tính số của máy quét.
     */
    private fun getPropertyInt(propertyId: Int): Int {
        val binder = sdkService ?: return -1
        return transactInt(SDK_GET_PROPERTY_INT, DESCRIPTOR_SDK, binder) { parcel ->
            parcel.writeInt(propertyId)
        }
    }

    /**
     * Tắt đèn chiếu sáng của đầu quét, chỉ giữ lại tia laser.
     *
     * Gọi lại mỗi lần bấm nút quét vì máy có thể tự ghi đè lại giá trị
     * này khi kích hoạt đầu đọc, và người dùng có thể đổi cấu hình trong
     * app ScanSettings của máy.
     */
    private fun disableIllumination() {
        val binder = sdkService ?: return

        // Tắt đèn chiếu sáng: mức sáng về giá trị "tắt".
        setPropertyInt(PROP_SET_CONTROL_ILLULEVEL, ILLUM_LEVEL_OFF)

        // Không chọn màu LED nào — laser không phụ thuộc vào thuộc tính này.
        setPropertyInt(PROP_ILLUM_MODE, 0)

        // `ILLUM_MODE` chỉ có hiệu lực sau khi commit.
        transactInt(SDK_COMMIT_PROPERTIES, DESCRIPTOR_SDK, binder) {}

        val level = getPropertyInt(PROP_SET_CONTROL_ILLULEVEL)
        Log.i(TAG, "đèn chiếu sáng: mức sáng=$level (tắt=$ILLUM_LEVEL_OFF)")
    }

    /**
     * Đăng ký BroadcastReceiver cho action quét của PDA.
     */
    private fun registerReceiver() {
        if (receiver != null) return

        val filter = IntentFilter(DEFAULT_DECODE_ACTION)
        filter.addCategory(DEFAULT_DECODE_CATEGORY)

        val broadcastReceiver = object : BroadcastReceiver() {
            override fun onReceive(ctx: Context?, intent: Intent?) {
                if (intent == null) return
                val text = intent.getStringExtra(EXTRA_BARCODE_STRING).orEmpty()
                val type = intent.getStringExtra(EXTRA_BARCODE_TYPE).orEmpty()
                Log.i(TAG, "onReceive action=${intent.action} barcode='$text'")
                if (text.isEmpty()) return
                emitScan(text, type)
            }
        }
        receiver = broadcastReceiver

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                // PDA scan service là app khác gửi broadcast tới → phải
                // RECEIVER_EXPORTED, nếu không sẽ không nhận được kết quả.
                context.registerReceiver(
                    broadcastReceiver,
                    filter,
                    Context.RECEIVER_EXPORTED
                )
            } else {
                context.registerReceiver(broadcastReceiver, filter)
            }
        } catch (e: Exception) {
            Log.e(TAG, "registerReceiver failed: ${e.message}")
            receiver = null
        }
    }

    /**
     * Huỷ đăng ký receiver.
     */
    fun unregisterReceiver() {
        val currentReceiver = receiver ?: return
        try {
            context.unregisterReceiver(currentReceiver)
        } catch (e: Exception) {
            // Bỏ qua - receiver có thể đã được unregister.
        }
        receiver = null
    }

    /**
     * Được MainActivity gọi khi nhận key event nút quét của phần cứng.
     *
     * @param event key event gốc từ hệ thống.
     * @return `false` cố ý: không nuốt event để hành vi mặc định của hệ thống
     *   không bị đổi.
     */
    fun handleKeyEvent(event: KeyEvent): Boolean {
        val buttonId = if (event.scanCode != 0) event.scanCode else event.keyCode
        val isScanTrigger = buttonId in SCAN_TRIGGER_SCAN_CODES ||
            event.keyCode == KEYCODE_BARCODE

        if (!isScanTrigger) return false

        Log.i(TAG, "nút quét scanCode=${event.scanCode} keyCode=${event.keyCode}")

        // Sau khi tắt hấp thụ phím, không còn ai kích hoạt đầu đọc nên app
        // phải tự gọi. Nhấn xuống bật, thả tay tắt — đúng như nút vật lý.
        if (event.action == KeyEvent.ACTION_DOWN) {
            // Mở lượt quét mới: mã giống nhau ở lượt sau vẫn được báo.
            scanSession++
            sink?.success(mapOf("keyEvent" to buttonId))
            // Chỉ dùng tia laser: tắt đèn trắng trước khi bật đầu đọc.
            disableIllumination()
            pressTrigger()
        } else if (event.action == KeyEvent.ACTION_UP) {
            releaseTrigger()
        }
        return false
    }

    /**
     * Kích hoạt đầu đọc mã (tương đương `pressTrigger()`).
     */
    private fun pressTrigger() {
        val result = transactInt(CORE_PRESS_TRIGGER, DESCRIPTOR_CORE, coreService) {}
        Log.i(TAG, "pressTrigger -> $result")
    }

    /**
     * Nhả đầu đọc mã (tương đương `releaseTrigger()`).
     */
    private fun releaseTrigger() {
        val result = transactInt(CORE_RELEASE_TRIGGER, DESCRIPTOR_CORE, coreService) {}
        Log.i(TAG, "releaseTrigger -> $result")
    }

    /**
     * Đẩy kết quả quét lên Flutter.
     *
     * Kết quả có thể đến từ cả listener của SDK lẫn broadcast của wedge,
     * nên cùng một lần quét có thể được báo hai lần. Chỉ chặn trùng
     * trong cùng một lượt quét (tức là từ lần bấm nút gần nhất) — quét
     * lại cùng mã ở lượt sau vẫn được báo bình thường.
     *
     * @param text nội dung mã đọc được.
     * @param type mã số loại mã của máy quét.
     */
    private fun emitScan(text: String, type: String) {
        // Listener của SDK gọi callback trên binder thread, còn `EventSink`
        // của Flutter bắt buộc phải gọi trên main thread. Nên toàn bộ xử lý
        // — kể cả việc chặn mã trùng — đều chạy trên main thread để không
        // bị tranh chấp với broadcast (broadcast chạy trên main thread).
        mainHandler.post {
            if (text == lastScanText && lastScanSession == scanSession) {
                Log.i(TAG, "bỏ qua mã trùng '$text'")
                return@post
            }
            lastScanText = text
            lastScanSession = scanSession

            sink?.success(
                mapOf(
                    "code" to text,
                    "barcodeType" to type,
                )
            )
        }
    }

    /**
     * Gửi một giao dịch có tham số và đọc kết quả kiểu int từ reply parcel.
     *
     * @return kết quả trả về, hoặc -1 nếu lỗi.
     */
    private fun transactInt(
        transaction: Int,
        descriptor: String,
        binder: IBinder?,
        writeArgs: (Parcel) -> Unit
    ): Int {
        if (binder == null) return -1
        val data = Parcel.obtain()
        val reply = Parcel.obtain()
        return try {
            data.writeInterfaceToken(descriptor)
            writeArgs(data)
            binder.transact(transaction, data, reply, 0)
            reply.readException()
            reply.readInt()
        } catch (e: Throwable) {
            Log.w(TAG, "lỗi transact $transaction: ${e.message}")
            -1
        } finally {
            data.recycle()
            reply.recycle()
        }
    }

    /**
     * Gửi một giao dịch không có kết quả trả về.
     */
    private fun transactVoid(
        transaction: Int,
        descriptor: String,
        writeArgs: (Parcel) -> Unit
    ) {
        val binder = coreService ?: return
        val data = Parcel.obtain()
        val reply = Parcel.obtain()
        try {
            data.writeInterfaceToken(descriptor)
            writeArgs(data)
            binder.transact(transaction, data, reply, 0)
            reply.readException()
        } catch (e: Throwable) {
            Log.w(TAG, "lỗi transact $transaction: ${e.message}")
        } finally {
            data.recycle()
            reply.recycle()
        }
    }

    /**
     * Lấy binder của một system service.
     *
     * `ServiceManager` là hidden API nên không gọi trực tiếp được từ app.
     *
     * @return binder của service, null nếu không tìm thấy.
     */
    private fun getSystemServiceBinder(name: String): IBinder? {
        return try {
            val serviceManagerClass = Class.forName("android.os.ServiceManager")
            serviceManagerClass
                .getMethod("getService", String::class.java)
                .invoke(null, name) as? IBinder
        } catch (e: Throwable) {
            Log.w(TAG, "không lấy được service '$name': ${e.message}")
            null
        }
    }
}
