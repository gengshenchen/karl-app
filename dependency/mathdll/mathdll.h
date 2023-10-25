#ifndef POWER__H
#define POWER__H

#ifdef __cplusplus//告诉编译器，这部分代码按C语言的格式进行编译，而不是C++的
extern "C"{
#endif

#define IO_MATH_DLL
#ifdef _WIN32
    // Windows-specific code
#define BUILD_MATH_DLL

#ifdef BUILD_MATH_DLL
#define IO_MATH_DLL __declspec(dllexport)
#else
#define IO_MATH_DLL __declspec(dllimport)
#endif
#endif

IO_MATH_DLL extern double power_(double base, int exponent);

#ifdef __cplusplus
}
 
#endif

#endif
