// ** I18N

// Calendar EN language
// Author: Mihai Bazon, <mihai_bazon@yahoo.com>
// Encoding: any
// Distributed under the same terms as the calendar itself.

// For translators: please use UTF-8 if possible.  We strongly believe that
// Unicode is the answer to a real internationalized world.  Also please
// include your contact information in the header, as can be seen above.

// full day names
Calendar._DN = new Array
("Sunday",
 "Monday",
 "Tuesday",
 "Wednesday",
 "Thursday",
 "Friday",
 "Saturday",
 "Sunday");

// Please note that the following array of short day names (and the same goes
// for short month names, _SMN) isn't absolutely necessary.  We give it here
// for exemplification on how one can customize the short day names, but if
// they are simply the first N letters of the full name you can simply say:
//
//   Calendar._SDN_len = N; // short day name length
//   Calendar._SMN_len = N; // short month name length
//
// If N = 3 then this is not needed either since we assume a value of 3 if not
// present, to be compatible with translation files that were written before
// this feature.

// short day names
Calendar._SDN = new Array
("��.",
 "�.",
 "�ѧ.",
 "�.",
 "��.",
 "�.",
 "�.",
 "��.");

// First day of the week. "0" means display Sunday first, "1" means display
// Monday first, etc.
Calendar._FD = 0;

// full month names
Calendar._MN = new Array
("���Ҥ�",
 "����Ҿѹ��",
 "�չҤ�",
 "����¹",
 "����Ҥ�",
 "�Զع�¹",
 "�á�Ҥ�",
 "�ԧ�Ҥ�",
 "�ѹ��¹",
 "���Ҥ�",
 "��Ȩԡ�¹",
 "�ѹ�Ҥ�");

// short month names
Calendar._SMN = new Array
("��.",
 "��.",
 "�դ.",
 "���.",
 "��.",
 "���.",
 "��.",
 "ʤ.",
 "��.",
 "��.",
 "��.",
 "��.");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "����ǡѺ Calendar";

Calendar._TT["ABOUT"] =
"DHTML Date/Time Selector\n" +
"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" + // don't translate this this ;-)
"�����ѹ����ش��� : http://www.dynarch.com/projects/calendar/\n" +
"Distributed under GNU LGPL.  See http://gnu.org/licenses/lgpl.html for details." +
"\n\n" +
"Date selection:\n" +
"- ��ҹ���� \xab, \xbb �������͡��\n" +
"- ��ҹ���� " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " �������͡��͹\n" +
"- ������������ҧ��� �˹�ͻ�������ͧ����������͡�����Ǣ��.";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"Time selection:\n" +
"- �������ǹ�ͧ time �����������Ң��\n" +
"- ���� Shift-click ����Ŵ����ŧ\n" +
"- ���� ������зӡ���ҡ���ͤ����Ǵ����.";

Calendar._TT["PREV_YEAR"] = "�ա�͹˹�� (����ҧ�����ʴ�����)";
Calendar._TT["PREV_MONTH"] = "��͹��͹˹�� (����ҧ�����ʴ�����)";
Calendar._TT["GO_TODAY"] = "� �ѹ���Ѩ�غѹ";
Calendar._TT["NEXT_MONTH"] = "��͹�Ѵ� (����ҧ�����ʴ�����)";
Calendar._TT["NEXT_YEAR"] = "�նѴ� (����ҧ�����ʴ�����)";
Calendar._TT["SEL_DATE"] = "���͡�ѹ";
Calendar._TT["DRAG_TO_MOVE"] = "�ҡ�������µ��˹�";
Calendar._TT["PART_TODAY"] = " (�ѹ�Ѩ�غѹ)";

// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
Calendar._TT["DAY_FIRST"] = "�ʴ� %s ��͹";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "�Դ";
Calendar._TT["TODAY"] = "�ѹ�Ѩ�غѹ";
Calendar._TT["TIME_PART"] = "(Shift-)���� ���� �ҡ ��������¹�ŧ���";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "%a, %b %e";

Calendar._TT["WK"] = "�ѻ����";
Calendar._TT["TIME"] = "����:";
