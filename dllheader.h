#include <windows.h>

// Implemented in main_dll.go, calls main()
void Main();

// DLL entry needs to be called in a new thread, so this function
// wraps it to meet the expected function signature
DWORD WINAPI DllAttach(LPVOID lpParam) {
    Main();
    return 0;
}

// DllMain will create a new thread for DLL_PROCESS_ATTACH, otherwise
// do nothing
WINBOOL WINAPI DllMain(
    HINSTANCE hinstDLL,
    DWORD fdwReason,
    LPVOID lpvReserved
) {
    switch (fdwReason) {
        case DLL_PROCESS_ATTACH:  {
            HANDLE t = CreateThread(0, 0, DllAttach, 0, 0, 0);
            if (t) CloseHandle(t);
            break;
          }
        case DLL_THREAD_ATTACH:
        case DLL_THREAD_DETACH:
        case DLL_PROCESS_DETACH:
            break;
    }

    return TRUE;
}
