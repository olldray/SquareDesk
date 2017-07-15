TEMPLATE = subdirs

SUBDIRS = html-tidy taglib test123

mac {
# sd and sdApp are MAC OS X ONLY for now.
#   sd needs to be compiled outside of Qt, I think,
#   or under cygwin.
SUBDIRS += sd sdApp
sd.subdir = sd
sdApp.subdir = sdApp

# what subproject depends on others -- test123 and sdApp depend on sd, test123 also depends on taglib and html-tidy
sdApp.depends = sd
test123.depends = sd taglib html-tidy
}

# WIN32: where to find the sub projects -----------------
taglib.subdir = taglib/taglib
test123.subdir = test123
html-tidy.subdir = html-tidy

win32 {
SUBDIRS += sd
sd.subdir = sd
test123.depends = sd taglib html-tidy
}
