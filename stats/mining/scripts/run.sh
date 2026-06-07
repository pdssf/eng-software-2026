#!/bin/bash

# Setup

rm -rf ../assets/ant
rm -rf ../assets/cassandra
rm -rf ../assets/commons-lang
rm -rf ../assets/derby
rm -rf ../assets/maven
rm -rf ../assets/phoenix
rm -rf ../assets/tomcat

rm -rf ../../data/ant
rm -rf ../../data/cassandra
rm -rf ../../data/commons-lang
rm -rf ../../data/derby
rm -rf ../../data/maven
rm -rf ../../data/phoenix
rm -rf ../../data/tomcat

mkdir -p ../../data/ant
mkdir -p ../../data/cassandra
mkdir -p ../../data/commons-lang
mkdir -p ../../data/derby
mkdir -p ../../data/maven
mkdir -p ../../data/phoenix
mkdir -p ../../data/tomcat

# Clone repos

git clone https://github.com/apache/ant.git ../assets/ant
git clone https://github.com/apache/cassandra.git ../assets/cassandra
git clone https://github.com/apache/commons-lang.git ../assets/commons-lang
git clone https://github.com/apache/derby.git ../assets/derby
git clone https://github.com/apache/maven.git ../assets/maven
git clone https://github.com/apache/phoenix.git ../assets/phoenix
git clone https://github.com/apache/tomcat.git ../assets/tomcat

# Find revisions

chmod +x revisions.sh

./revisions.sh ../assets/ant ../../data/ant/commits.txt
./revisions.sh ../assets/cassandra ../../data/cassandra/commits.txt
./revisions.sh ../assets/commons-lang ../../data/commons-lang/commits.txt
./revisions.sh ../assets/derby ../../data/derby/commits.txt
./revisions.sh ../assets/maven ../../data/maven/commits.txt
./revisions.sh ../assets/phoenix ../../data/phoenix/commits.txt
./revisions.sh ../assets/tomcat ../../data/tomcat/commits.txt

# Run SpotBugs for each revision

chmod +x spotbugs/ant.sh
./spotbugs/ant.sh ../assets/ant ../../data/ant ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x spotbugs/cassandra.sh
./spotbugs/cassandra.sh ../assets/cassandra ../../data/cassandra ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x ./spotbugs/commons-lang.sh
./spotbugs/commons-lang.sh ../assets/commons-lang ../../data/commons-lang ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x spotbugs/derby.sh
./spotbugs/derby.sh ../assets/derby ../../data/derby ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x spotbugs/maven.sh
./spotbugs/maven.sh ../assets/maven ../../data/maven ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x spotbugs/phoenix.sh
./spotbugs/phoenix.sh ../assets/phoenix ../../data/phoenix ../assets/spotbugs-4.9.8/bin/spotbugs

chmod +x spotbugs/tomcat.sh
./spotbugs/tomcat.sh ../assets/tomcat ../../data/tomcat ../assets/spotbugs-4.9.8/bin/spotbugs

