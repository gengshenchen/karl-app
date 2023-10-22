#ifndef POWER__H
#define POWER__H

#define BUILD_MATH_DLL

#ifdef BUILD_MATH_DLL
#define IO_MATH_DLL __declspec(dllexport)
#else
#define IO_MATH_DLL __declspec(dllimport)
#endif

IO_MATH_DLL extern double power_(double base, int exponent);

#endif
