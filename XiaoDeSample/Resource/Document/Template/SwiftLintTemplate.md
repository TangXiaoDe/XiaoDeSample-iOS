#  SwiftLintTemplate

 * 全局安装 - RunScript

 ```
 if which swiftlint >/dev/null; then
   swiftlint
 else
   echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
 fi
 ```

* Pod安装 - 

* RunScript
 * Target -> xxx -> Build Phases -> RunScript / New Run Script Phase； 
 * Script:  ```"${PODS_ROOT}/SwiftLint/swiftlint"```



* 自定义配置文件```.swiftlint.yml```

```
included: # 执行 linting 时包含的路径
  - XiaoDeSample/
  - XiaoDeSampleTests/
excluded: # 执行 linting 时忽略的路径
  - Pods
  - XiaoDeSample/Source/Libraries/ # 该目录下的代码由三方提供，非开发人员原著，故代码风格难以统一，因此忽略掉
  
file_length: # 文档源码行数
  warning: 400
  error: 1000
function_body_length: # 函数行数
  warning: 40
  error: 100
function_parameter_count: # 函数参数数量
  warning: 5
  error: 8
type_name: # 类型名称只能包含字母数字字符,以大写字符开头,长度介于3到40个字符之间,不允许使用下划线命名法
  min_length: 4
  max_length:
    warning: 40
    error: 50
  excluded: # 排除某个名字
    - iPhone
variable_name: # 变量名称
  min_length: 
    warning: 5
    error: 3
  max_lengt:
    warning: 40
    error: 50
  excluded: # 排除某个名字
    - id
    - url
    - URL
    - Url
attributes: # 属性应该在函数和类型中各自的行,但在变量和导入的同一行
  always_on_same_line:  ["@IBAction", "@NSManaged"]
  always_on_line_above: []

whitelist_rules: # 开启的规则
  - closing_brace              # 闭包结束的括号和括号直接不允许有空格
  - closure_parameter_position # 闭包参数应该与大括号在同一行
  - closure_end_indentation    # 闭包结束应该与启动它的行具有相同的缩进
  - closure_spacing            # 闭包表达式在每个大括号内应该有一个空格
  - colon                      # 指定类型时,冒号应位于标识符旁边,并且在字典文字中的键旁边
  - comma                      # 在逗号之前没有空格,之后有一个空格
  - control_statement          # if，for，while，do语句不应该将它们的条件包装在括号中
  - conditional_returns_on_newline # 条件语句应始终换行
  - custom_rules               # 激活自定义规则
#  - cyclomatic_complexity      # 代码的复杂度不应该过高
  - dynamic_inline             # 避免在一起使用'dynamic'和'@inline(__always)'
  - empty_parameters           # 首选 `() ->` 而不是 `Void ->`
  - empty_parentheses_with_trailing_closure # 当使用尾随闭包时,应在方法调用后避免使用空括号
#  - empty_count                # 必须使用`isEmpty`来检查`count`和零对比的情况
#  - explicit_init              # 不允许显示调用`.init()`
  - first_where                # 在集合中优先使用`.first(where:)`而不是`.filter { }.first`
  - implicit_getter            # 计算的只读属性应避免使用`get`关键字
  - leading_whitespace         # 文件不应该包含前置空格和换行
  - legacy_cggeometry_functions # 结构扩展属性和方法优于传统功能
  - legacy_constant            # 结构域范围的常量优于传统的全局常量
  - legacy_constructor         # Swift构造函数优于传统的便利函数
  - legacy_nsgeometry_functions # 结构扩展属性和方法优于传统功能
  - mark                       # mark 的写法必须遵循格式
  - nesting                    # 类型应嵌套最多1级深,语句应嵌套最多5级深
  - number_separator           # 数字超过每 3 位,使用下划线进行分割
  - opening_brace              # 开头括号前面应该有一个空格，并且在声明的同一行
  - operator_usage_whitespace  # 当使用操作符时，它们应该被单个空格包围
  - operator_whitespace        # 当使用函数相关操作符时,它们应该被单个空格包围
  - overridden_super_call      # 某些重写的方法必须调用超类对应的方法
  - redundant_string_enum_value # 当字符串枚举值等于枚举名称时，可以省略它们
  - return_arrow_whitespace    # 返回箭头和返回类型应由单个空格或单独的行分隔
  - statement_position         # Else和catch应该在同一行，前一个声明后一个空格
  - switch_case_on_newline     # 选择器的处理代码应该写在新的一行
  - trailing_comma             # 应该避免在数组和字典中末尾使用多余的逗号
  - trailing_newline           # 文件应该有一个单一的尾随换行符
  - trailing_semicolon         # 行末尾不允许有尾部分号
  - trailing_whitespace        # 行不应该有尾部空格
#  - vertical_whitespace        # 将垂直空白限制为一个空行
  - void_return                # 应该使用`-> Void` 而不是 `-> ()`
# 代理使用weak修饰，仍然有该提示，暂先注释处理
#  - weak_delegate              # 代理应该使用弱类型,避免进入循环

# disabled_rules: # 关闭的规则
#   - todo                       # TODO FIXME 会产生警告, 尽量避免提交到主干
#   - file_header                # 头文件注释应该具有一致的样式和内容 (无法正常匹配)
#   - force_unwrapping           # 不允许强制解包,解包之前必须判断
#   - force_cast                 # 应该避免使用强制类型和转换,而使用隐式解析可选类型
#   - empty_count                # 必须使用`isEmpty`来检查`count`和零对比的情况
#   - valid_docs                 # 文档化的声明应该有效 (无法正常使用)
#   - missing_docs               # 公共声明应含有响应的文档 (无法正常使用)
#   - redundant_nil_coalescing   # 只有当lhs是nil时，才会评估nil聚结运算符，如果rhs是冗余的，则使用nil的聚结运算符
#   - private_outlet             # outlet应该私有,以避免泄漏
#   - valid_ibinspectable # IBInspectables应该只应用于变量，使其类型显式并且是支持的类型
#   - unused_closure_parameter # 未使用的闭包参数
#   - unused_enumerated # 未使用的索引
#   - syntactic_sugar # 速写语法糖
#   - force_try # `try!`应该避免使用
#   - line_length # 行字符长度
```

