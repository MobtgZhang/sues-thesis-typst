// 定义硕士学位论文模板
// 中文封面页信息
//============================================================================
#let num2month = (
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
)
// 中文封面页信息
// 中图分类号
#let master_classification_num = "CXX"
// 学号信息
#let master_class_number = "M987654321"
// 作者姓名
#let master_chinese_candidate_name = "MobtgZhang"
// 导师姓名
#let master_chinese_supervisor_name = "Supervisor"
// 专业名称
#let master_chinese_major_name = "控制科学与工程"
// 学院名称
#let master_chinese_faculty_name = "电子电气工程学院"
// 学位名称，分工学硕士和专业硕士
#let master_degree_name = "工学硕士"
// 中文完成日期
#let date_today = datetime.today()
#let master_chinese_finish_date_time = str(date_today.year())+" 年" + str(date_today.month()) + "月"
// 论文题目
#let master_chinese_title = "上海工程技术大学Typst模板"

#let master_reviewer = "A评阅"
#let master_chairman = "A主席"
#let master_member_first = "成员一、成员二"
#let master_member_second = "成员三、成员四"

//英文封面页信息
// 作者英文姓名
#let master_english_candidate_name = "Author Mr.Z"
// 导师英文姓名
#let master_english_supervisor_name = "Supervisor Mr.H"
// 专业英文名称
#let master_english_major_name = "Control Science and Engineering"
// 论文英文题目
#let master_english_title = "The Typst Template for Shanghai University of Engineering Science"
// 学院英文名称
#let master_english_faculty_name = "School of Electronic and Electrical Engineering"
// 英文完成日期
#let master_english_finish_date_time = str(num2month.at(date_today.month()-1))+" "+str(date_today.year())
