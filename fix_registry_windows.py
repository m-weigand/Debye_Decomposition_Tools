#!/usr/bin/python
import _winreg as wreg

for base, path in zip((wreg.HKEY_CLASSES_ROOT,
                       wreg.HKEY_CLASSES_ROOT),
                      ("Applications\\python.exe\\shell\\open",
                       "py_auto_file\\shell\\open",
                       )):

    key = wreg.OpenKey(base,
                       path,
                       0,
                       wreg.KEY_ALL_ACCESS)

    old_value = wreg.QueryValue(key, 'command')

    if old_value.endswith('"%1"'):
        print('Fixing registry: {0}\\{1}'.format(base, path))
        new_value = old_value + ' %*'
        wreg.SetValue(key, 'command', wreg.REG_SZ, new_value)

