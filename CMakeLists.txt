file(GLOB SRC_FILES "*.s")
assemble_65c02(msbasic SOURCES msbasic.s DEFINES plbs DEPENDS ${SRC_FILES})
