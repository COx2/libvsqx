#find TinyXML2
FIND_PATH(
	TINYXML2_INCLUDE_DIR
	"tinyxml2.h"
)

FIND_LIBRARY(
	TINYXML2_LIBRARY
	NAMES "tinyxml2"
)
MARK_AS_ADVANCED(
	TINYXML2_INCLUDE_DIR
	TINYXML2_LIBRARY
)


IF( TINYXML2_INCLUDE_DIR AND EXISTS "${TINYXML2_INCLUDE_DIR}/tinyxml2.h" )
	FILE(
	STRINGS "${TINYXML2_INCLUDE_DIR}/tinyxml2.h"
	TINYXML2_VERSION_MAJOR
	REGEX "^const int TIXML2_MAJOR_VERSION = [0-9]+;$"
	)
	FILE(
	STRINGS "${TINYXML2_INCLUDE_DIR}/tinyxml2.h"
	TINYXML2_VERSION_MINOR
	REGEX "^const int TIXML2_MINOR_VERSION = [0-9]+;$"
	)
	FILE(
	STRINGS "${TINYXML2_INCLUDE_DIR}/tinyxml2.h"
	TINYXML2_VERSION_PATCH
	REGEX "^const int TIXML2_PATCH_VERSION = [0-9]+;$"
	)
	STRING(
	REGEX REPLACE "^.*TIXML2_MAJOR_VERSION = ([0-9]+).*$" "\\1"
	TINYXML2_VERSION_MAJOR "${TINYXML2_VERSION_MAJOR}"
	)
	STRING(
	REGEX REPLACE "^.*TIXML2_MINOR_VERSION = ([0-9]+).*$" "\\1"
	TINYXML2_VERSION_MINOR "${TINYXML2_VERSION_MINOR}"
	)
	STRING(
	REGEX REPLACE "^.*TIXML2_PATCH_VERSION = ([0-9]+).*$" "\\1"
	TINYXML2_VERSION_PATCH "${TINYXML2_VERSION_PATCH}"
	)
	SET( TINYXML2_VERSION "${TINYXML2_VERSION_MAJOR}.${TINYXML2_VERSION_MINOR}.${TINYXML2_VERSION_PATCH}" )
ENDIF()

SET( TINYXML2_INCLUDE_DIRS "${TINYXML2_INCLUDE_DIR}" )
SET( TINYXML2_LIBRARIES "${TINYXML2_LIBRARY}" )

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	"TinyXML2"
	REQUIRED_VARS TINYXML2_LIBRARIES TINYXML2_INCLUDE_DIRS
	VERSION_VAR TINYXML2_VERSION
)

