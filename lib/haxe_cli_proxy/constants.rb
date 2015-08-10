module HaxeCliProxy
  module Constants
    HAXE = 'haxe'

    COMPILE_MAIN = '-main'
    COMPILE_DEC = '-dce'
    COMPILE_LIB = '-lib'
    COMPILE_FLAG = '-D'
    COMPILE_VERBOSE = '-v'
    COMPILE_DEBUG = '-debug'

    TARGET_CP = 'cp'
    TARGET_JS = 'js'
    TARGET_SWF = 'swf'
    TARGET_AS3 = 'as3'
    TARGET_NEKO = 'neko'
    TARGET_PHP = 'php'
    TARGET_CPP = 'cpp'
    TARGET_JAVA = 'java'
    TARGET_PYTHON = 'python'
    TARGETS = {
      TARGET_CP => '-cp',
      TARGET_JS => '-js',
      TARGET_SWF => '-swf',
      TARGET_AS3 => '-as3',
      TARGET_NEKO => '-neko',
      TARGET_PHP => '-php',
      TARGET_CPP => '-cpp',
      TARGET_JAVA => '-java',
      TARGET_PYTHON => '-python'
    }

    DED_CODE_STANDARD = 'std'
    DED_CODE_FULL = 'full'
    DED_CODE_NO = 'no'
    DED_CODE_OPTIONS = [ DED_CODE_STANDARD, DED_CODE_FULL, DED_CODE_NO ]

    OPTION_XML = '-xml'
    OPTION_HELP = '-help'
    OPTION_LIB = '-lib'
  end
end