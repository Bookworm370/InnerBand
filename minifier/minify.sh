#!/bin/bash

#
# The minifier condenses the iBoost code into a simply .h/.m pair. Handy!
#
shopt -s nullglob

DIRNAME=`dirname $0`
BOOSTDIR=$DIRNAME/../iBoost

if [ $# != 1 -o "$1" = "all" -a "$1" = "core" ]
then
	printf 'USAGE: %s all|core\n' $0
	exit 1
fi

INCLUSION=$1

if [ $INCLUSION = 'all' ]
then
	INCLUDE_FILENAME='iBoost.h'
	CODE_FILENAME='iBoost.m'
	HEADER_FILES="$BOOSTDIR/*.h $BOOSTDIR/*/*.h $BOOSTDIR/*/*/*.h $BOOSTDIR/*/*/*/*.h"
	SOURCE_FILES="$BOOSTDIR/*.m $BOOSTDIR/*/*.m $BOOSTDIR/*/*/*.m $BOOSTDIR/*/*/*/*.m"
else
	INCLUDE_FILENAME='iBoostCore.h'
	CODE_FILENAME='iBoostCore.m'
	HEADER_FILES="$BOOSTDIR/Core/*.h $BOOSTDIR/Core/*/*.h $BOOSTDIR/Core*Data/*.h $BOOSTDIR/Message*Center/*.h $BOOSTDIR/Message*Center/*/*.h"
	SOURCE_FILES="$BOOSTDIR/Core/*.m $BOOSTDIR/Core/*/*.m $BOOSTDIR/Core*Data/*.m $BOOSTDIR/Message*Center/*.m $BOOSTDIR/Message*Center/*/*.m"
fi

IBOOST_HEADER_FILE=$HOME/Desktop/$INCLUDE_FILENAME
IBOOST_SOURCE_FILE=$HOME/Desktop/$CODE_FILENAME

cat > $IBOOST_HEADER_FILE <<EOF
//
//  iBoost
//
//  iBoost - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

@class CoreDataStore;

EOF

cat > $IBOOST_SOURCE_FILE <<EOF
//
//  iBoost
//
//  iBoost - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "${INCLUDE_FILENAME}"
EOF

for HEADER_FILE in $HEADER_FILES	
do
	grep -q "^@interface" "$HEADER_FILE"
	
	if (( $? != 0 ))
	then
		( echo ; grep -v "^//" "$HEADER_FILE" | grep -v "^#import"; echo ) >> "$IBOOST_HEADER_FILE"
	fi
done

for HEADER_FILE in $HEADER_FILES	
do
	grep -q "^@interface" "$HEADER_FILE"
	
	if (( $? == 0 ))
	then
		( echo ; grep -v "^//" "$HEADER_FILE" | grep -v "^#import \""; echo ) >> "$IBOOST_HEADER_FILE"
	fi
done

for SOURCE_FILE in $SOURCE_FILES	
do
	( echo ; grep -v "^//" "$SOURCE_FILE" | grep -v "^#import \""; echo ) >> "$IBOOST_SOURCE_FILE"
done
