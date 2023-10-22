# 查找当前目录下的所有源文件 头文件不会
# 并将名称保存到 DIR_LIB_SRCS 变量
# aux_source_directory(. DIR_LIB_SRCS)



file(GLOB_RECURSE SOURCE_FILE *.cc *.cpp)
file(GLOB_RECURSE HEAD_FILE *.h)

# 生成链接库 SHARED or  STATIC
# add_library (mathkarl  SHARED ${DIR_LIB_SRCS})
add_library (mathkarl  SHARED ${HEAD_FILE} ${SOURCE_FILE})

# # 指定 MathFunctions 库的安装路径
install (TARGETS mathkarl DESTINATION /) #lib
#install (FILES mathdll.h DESTINATION include)
