#!/bin/sh
KEYWORD="DELETE THIS LINE"

rm -rf ./tmp
mkdir tmp
cp -r src pom.xml tmp
pushd tmp

sed -i -e "s/am\.ik\.archetype/xxxxxx.yyyyyy.zzzzzz/g" pom.xml
sed -i -e "s/spring-boot-blank/projectName/g" pom.xml

mvn archetype:create-from-project

pushd target/generated-sources/archetype
sed -i -e "/$KEYWORD/d" target/classes/archetype-resources/pom.xml
sed -i -e "s/xxxxxx\.yyyyyy\.zzzzzz/am.ik.archetype/g" pom.xml
sed -i -e "s/projectName/spring-boot-blank/g" pom.xml
