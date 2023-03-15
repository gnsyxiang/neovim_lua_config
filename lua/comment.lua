


-- /****************************************************************************
-- * Copyright (C), 2010-2011,江西科萌科技控股有限公司
-- * 文件名: main.c
-- * 内容描述：
-- *
-- * 文件历史：
-- * 版本号 日期 作者 說明
-- * 01a 2010-07-29 LHT 新建文件
-- * 01b 2010-08-20 LHT 修改可以在字符串中發送字符
-- * 02a 2010-12-03 LHT 增加文件头注釋
-- */

vim.cmd([[

function AddrmCTitle()
call append( 0, "/**")
call append( 1, " * ")
call append( 2, " * Copyright (C), 2010-2011,江西科萌科技控股有限公司")
call append( 3, " * ")
call append( 4, " * @file    ".expand("%:t"))		            " %表示绝对路径，%:h表示目录，%:t表示文件名
call append( 5, " * @brief   ")	                                " append表示追加
call append( 6, " * @author  gnsyxiang <gnsyxiang@163.com>")
call append( 7, " * @date    ".strftime("%d/%m %Y %H:%M"))
call append( 8, " * @version v0.0.1")
call append( 9, " * ")
call append(10, " * @since    note")
call append(11, " * @note     note")
call append(12, " * ")
call append(13, " *     change log:")
call append(14, " *     NO.     Author              Date            Modified")
call append(15, " *     00      zhenquan.qiu        ".strftime("%d/%m %Y")."      create the file")
call append(16, " * ")
call append(17, " *     last modified: ".strftime("%d/%m %Y %H:%M"))
call append(18, " */")
echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

function AddrmHTitle()
call append( 0, "/**")
call append( 1, " *")
call append( 2, " * Copyright (C), 2010-2011,江西科萌科技控股有限公司")
call append( 3, " * ")
call append( 4, " * @file    ".expand("%:t"))		            " %表示绝对路径，%:h表示目录，%:t表示文件名
call append( 5, " * @brief   ")	                                " append表示追加
call append( 6, " * @author  gnsyxiang <gnsyxiang@163.com>")
call append( 7, " * @date    ".strftime("%d/%m %Y %H:%M"))
call append( 8, " * @version v0.0.1")
call append( 9, " * ")
call append(10, " * @since    note")
call append(11, " * @note     note")
call append(12, " * ")
call append(13, " *     change log:")
call append(14, " *     NO.     Author              Date            Modified")
call append(15, " *     00      zhenquan.qiu        ".strftime("%d/%m %Y")."      create the file")
call append(16, " * ")
call append(17, " *     last modified: ".strftime("%d/%m %Y %H:%M"))
call append(18, " */")
call append(19, "#ifndef __")
call append(20, "#define ")
call append(21, "")
call append(22, "#ifdef __cplusplus")
call append(23, "extern \"C\" {")
call append(24, "#endif")
call append(25, "")
call append(26, "#ifdef __cplusplus")
call append(27, "}")
call append(28, "#endif")
call append(29, "")
call append(30, "#endif")
echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
]])
