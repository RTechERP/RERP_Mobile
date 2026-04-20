import 'package:flutter/material.dart';
import '../../../../../../../../../common/widgets/form/form_radio_group.dart';

const kProjectId = 'wc_add_project_id';
const kProjectText = 'wc_add_project_text';

String kTypeId(String key) => 'wc_${key}_type_id';
String kTypeText(String key) => 'wc_${key}_type_text';
String kStatus(String key) => 'wc_${key}_status';
String kAssignerId(String key) => 'wc_${key}_assigner_id';
String kAssignerText(String key) => 'wc_${key}_assigner_text';
String kParentId(String key) => 'wc_${key}_parent_id';
String kParentText(String key) => 'wc_${key}_parent_text';
String kLocationType(String key) => 'wc_${key}_loc_type';
String kLocationField(String key) => 'wc_${key}_loc_field';
String kMission(String key) => 'wc_${key}_mission';
String kPlanStart(String key) => 'wc_${key}_plan_start';
String kPlanEnd(String key) => 'wc_${key}_plan_end';
String kPlanDays(String key) => 'wc_${key}_plan_days';
String kActualStart(String key) => 'wc_${key}_actual_start';
String kActualEnd(String key) => 'wc_${key}_actual_end';
String kPercent(String key) => 'wc_${key}_percent';

const kStatusOptions = [
  FormRadioOption(value: '1', icon: Icons.play_circle_outline, label: 'Đang làm'),
  FormRadioOption(value: '2', icon: Icons.check_circle_outline, label: 'Hoàn thành'),
  FormRadioOption(value: '0', icon: Icons.radio_button_unchecked, label: 'Chưa làm'),
  FormRadioOption(value: '3', icon: Icons.pause_circle_outline, label: 'Pending'),
];

const kLocVtc = 'VTC';
const kLocOther = 'OTHER';
const kDefaultLocation = 'VP RTC';
