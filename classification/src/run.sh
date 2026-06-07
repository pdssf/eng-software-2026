#!/bin/bash

# Directories setup

rm -f ../logs/*

mkdir -p ../data/current/train
mkdir -p ../data/current/test

rm -f ../data/current/train/*
rm -f ../data/current/test/*

echo "Created directories"

# Experiments

## Old, without leaked features, only leaked features and kNN results

cp ../data/prior/total_features/ant/training_set/totalFeatures4.csv ../data/current/train/ant_totalFeatures4.csv
cp ../data/prior/total_features/ant/test_set/totalFeatures5.csv  ../data/current/test/ant_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_ant.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_ant.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_ant.log
NN=true python3 baseline.py &> ../logs/nn_table4_ant.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_ant.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_ant.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for ant"

cp ../data/prior/total_features/cass/training_set/totalFeatures4.csv ../data/current/train/cass_totalFeatures4.csv
cp ../data/prior/total_features/cass/test_set/totalFeatures5.csv  ../data/current/test/cass_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_cass.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_cass.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_cass.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_cass.log
NN=true python3 baseline.py &> ../logs/nn_table4_cass.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_cass.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_cass.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_cass.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for cassandra"

cp ../data/prior/total_features/commons/training_set/totalFeatures4.csv ../data/current/train/commons_totalFeatures4.csv
cp ../data/prior/total_features/commons/test_set/totalFeatures5.csv  ../data/current/test/commons_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_commons.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_commons.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_commons.log
NN=true python3 baseline.py &> ../logs/nn_table4_commons.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_commons.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_commons.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for commons"

cp ../data/prior/total_features/derby/training_set/totalFeatures4.csv ../data/current/train/derby_totalFeatures4.csv
cp ../data/prior/total_features/derby/test_set/totalFeatures5.csv  ../data/current/test/derby_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_derby.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_derby.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_derby.log
NN=true python3 baseline.py &> ../logs/nn_table4_derby.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_derby.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_derby.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for derby"

cp ../data/prior/total_features/jmeter/training_set/totalFeatures4.csv ../data/current/train/jmeter_totalFeatures4.csv
cp ../data/prior/total_features/jmeter/test_set/totalFeatures5.csv  ../data/current/test/jmeter_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_jmeter.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_jmeter.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_jmeter.log
NN=true python3 baseline.py &> ../logs/nn_table4_jmeter.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_jmeter.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_jmeter.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for jmeter"

cp ../data/prior/total_features/lucence/training_set/totalFeatures4.csv ../data/current/train/lucence_totalFeatures4.csv
cp ../data/prior/total_features/lucence/test_set/totalFeatures5.csv  ../data/current/test/lucence_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_lucence.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_lucence.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_lucence.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_lucence.log
NN=true python3 baseline.py &> ../logs/nn_table4_lucence.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_lucence.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_lucence.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_lucence.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for lucene-solr"

cp ../data/prior/total_features/mvn/training_set/totalFeatures4.csv ../data/current/train/mvn_totalFeatures4.csv
cp ../data/prior/total_features/mvn/test_set/totalFeatures5.csv  ../data/current/test/mvn_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_mvn.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_mvn.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_mvn.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_mvn.log
NN=true python3 baseline.py &> ../logs/nn_table4_mvn.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_mvn.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_mvn.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_mvn.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for maven"

cp ../data/prior/total_features/phoenix/training_set/totalFeatures4.csv ../data/current/train/phoenix_totalFeatures4.csv
cp ../data/prior/total_features/phoenix/test_set/totalFeatures5.csv  ../data/current/test/phoenix_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_phoenix.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_phoenix.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_phoenix.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_phoenix.log
NN=true python3 baseline.py &> ../logs/nn_table4_phoenix.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_phoenix.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_phoenix.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_phoenix.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for phoenix"

cp ../data/prior/total_features/tomcat/training_set/totalFeatures4.csv ../data/current/train/tomcat_totalFeatures4.csv
cp ../data/prior/total_features/tomcat/test_set/totalFeatures5.csv  ../data/current/test/tomcat_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3a_tomcat.log
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3b_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3b_tomcat.log
ONLY_LEAKED=true python3 baseline.py &> ../logs/only_leaked_table4_tomcat.log
NN=true python3 baseline.py &> ../logs/nn_table4_tomcat.log
NN=3 python3 baseline.py &> ../logs/nn3_table4_tomcat.log
NN=5 python3 baseline.py &> ../logs/nn5_table4_tomcat.log
NN=10 python3 baseline.py &> ../logs/nn10_table4_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated old, without leaked features, only leaked features and kNN results for tomcat"

## Withot data duplication results

cp ../data/prior/total_features/ant/training_set/totalFeatures4.csv ../data/current/train/ant_totalFeatures4.csv
cp ../data/prior-dedup/total_features/ant/test_set/totalFeatures5.csv  ../data/current/test/ant_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for ant"

cp ../data/prior/total_features/cass/training_set/totalFeatures4.csv ../data/current/train/cass_totalFeatures4.csv
cp ../data/prior-dedup/total_features/cass/test_set/totalFeatures5.csv  ../data/current/test/cass_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_cass.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_cass.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for cassandra"

cp ../data/prior/total_features/commons/training_set/totalFeatures4.csv ../data/current/train/commons_totalFeatures4.csv
cp ../data/prior-dedup/total_features/commons/test_set/totalFeatures5.csv  ../data/current/test/commons_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for commons"

cp ../data/prior/total_features/derby/training_set/totalFeatures4.csv ../data/current/train/derby_totalFeatures4.csv
cp ../data/prior-dedup/total_features/derby/test_set/totalFeatures5.csv  ../data/current/test/derby_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for derby"

cp ../data/prior/total_features/jmeter/training_set/totalFeatures4.csv ../data/current/train/jmeter_totalFeatures4.csv
cp ../data/prior-dedup/total_features/jmeter/test_set/totalFeatures5.csv  ../data/current/test/jmeter_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for jmeter"

cp ../data/prior/total_features/lucence/training_set/totalFeatures4.csv ../data/current/train/lucence_totalFeatures4.csv
cp ../data/prior-dedup/total_features/lucence/test_set/totalFeatures5.csv  ../data/current/test/lucence_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_lucence.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_lucence.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for lucene-solr"

cp ../data/prior/total_features/mvn/training_set/totalFeatures4.csv ../data/current/train/mvn_totalFeatures4.csv
cp ../data/prior-dedup/total_features/mvn/test_set/totalFeatures5.csv  ../data/current/test/mvn_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_mvn.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_mvn.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for maven"

cp ../data/prior/total_features/phoenix/training_set/totalFeatures4.csv ../data/current/train/phoenix_totalFeatures4.csv
cp ../data/prior-dedup/total_features/phoenix/test_set/totalFeatures5.csv  ../data/current/test/phoenix_totalFeatures5.csv
python3 baseline.py &> ../logs/baseline_table3c_phoenix.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_phoenix.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for phoenix"

cp ../data/prior/total_features/tomcat/training_set/totalFeatures4.csv ../data/current/train/tomcat_totalFeatures4.csv
cp ../data/prior-dedup/total_features/tomcat/test_set/totalFeatures5.csv  ../data/current/test/tomcat_totalFeatures5.csv\
python3 baseline.py &> ../logs/baseline_table3c_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table3c_tomcat.log\
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without data duplication for tomcat"

## Without leaked features and data duplication

cp ../data/prior/total_features/ant/training_set/totalFeatures4.csv ../data/current/train/ant_totalFeatures4.csv
cp ../data/prior-dedup/total_features/ant/test_set/totalFeatures5.csv  ../data/current/test/ant_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for ant"

cp ../data/prior/total_features/cass/training_set/totalFeatures4.csv ../data/current/train/cass_totalFeatures4.csv
cp ../data/prior-dedup/total_features/cass/test_set/totalFeatures5.csv  ../data/current/test/cass_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_cass.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for cassandra"

cp ../data/prior/total_features/commons/training_set/totalFeatures4.csv ../data/current/train/commons_totalFeatures4.csv
cp ../data/prior-dedup/total_features/commons/test_set/totalFeatures5.csv  ../data/current/test/commons_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for commons"

cp ../data/prior/total_features/derby/training_set/totalFeatures4.csv ../data/current/train/derby_totalFeatures4.csv
cp ../data/prior-dedup/total_features/derby/test_set/totalFeatures5.csv  ../data/current/test/derby_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for derby"

cp ../data/prior/total_features/jmeter/training_set/totalFeatures4.csv ../data/current/train/jmeter_totalFeatures4.csv
cp ../data/prior-dedup/total_features/jmeter/test_set/totalFeatures5.csv  ../data/current/test/jmeter_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for jmeter"

cp ../data/prior/total_features/lucence/training_set/totalFeatures4.csv ../data/current/train/lucence_totalFeatures4.csv
cp ../data/prior-dedup/total_features/lucence/test_set/totalFeatures5.csv  ../data/current/test/lucence_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_lucence.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for lucene-solr"

cp ../data/prior/total_features/mvn/training_set/totalFeatures4.csv ../data/current/train/mvn_totalFeatures4.csv
cp ../data/prior-dedup/total_features/mvn/test_set/totalFeatures5.csv  ../data/current/test/mvn_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_mvn.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for maven"

cp ../data/prior/total_features/phoenix/training_set/totalFeatures4.csv ../data/current/train/phoenix_totalFeatures4.csv
cp ../data/prior-dedup/total_features/phoenix/test_set/totalFeatures5.csv  ../data/current/test/phoenix_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_phoenix.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for phoenix"

cp ../data/prior/total_features/tomcat/training_set/totalFeatures4.csv ../data/current/train/tomcat_totalFeatures4.csv
cp ../data/prior-dedup/total_features/tomcat/test_set/totalFeatures5.csv  ../data/current/test/tomcat_totalFeatures5.csv
DROP=true python3 baseline.py &> ../logs/baseline_without_leaked_features_table3d_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without leaked features and data duplication for tomcat"

## 2016

cp ../data/reimplemented_2016/train/ant_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/ant_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for ant"

cp ../data/reimplemented_2016/train/commons_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/commons_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for commons"

cp ../data/reimplemented_2016/train/jmeter_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/jmeter_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for jmeter"

cp ../data/reimplemented_2016/train/maven_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/maven_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_maven.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_maven.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for maven"

cp ../data/reimplemented_2016/train/cassandra_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/cassandra_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_cassandra.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_cassandra.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for cassandra"

cp ../data/reimplemented_2016/train/derby_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/derby_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for derby"

cp ../data/reimplemented_2016/train/lucene-solr_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/lucene-solr_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_lucene-solr.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_lucene-solr.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for lucene-solr"

cp ../data/reimplemented_2016/train/tomcat_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dedup/test/tomcat_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2016_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2016_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2016 results for tomcat"

## 2017

cp ../data/reimplemented_2017/train/ant_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/ant_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for ant"

cp ../data/reimplemented_2017/train/commons_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/commons_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for commons"

cp ../data/reimplemented_2017/train/jmeter_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/jmeter_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for jmeter"

cp ../data/reimplemented_2017/train/maven_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/maven_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_maven.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_maven.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for maven"

cp ../data/reimplemented_2017/train/cassandra_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/cassandra_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_cassandra.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_cassandra.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for cassandra"

cp ../data/reimplemented_2017/train/derby_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/derby_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for derby"

cp ../data/reimplemented_2017/train/lucene-solr_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/lucene-solr_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_lucene-solr.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_lucene-solr.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for lucene-solr"

cp ../data/reimplemented_2017/train/tomcat_B_features.csv ../data/current/train
cp ../data/reimplemented_2017_dedup/test/tomcat_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2017_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2017_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2017 results for tomcat"

## 2018

cp ../data/reimplemented_2018/train/ant_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/ant_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for ant"

cp ../data/reimplemented_2018/train/commons_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/commons_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for commons"

cp ../data/reimplemented_2018/train/jmeter_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/jmeter_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for jmeter"

cp ../data/reimplemented_2018/train/maven_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/maven_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_maven.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_maven.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for maven"

cp ../data/reimplemented_2018/train/cassandra_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/cassandra_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_cassandra.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_cassandra.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for cassandra"

cp ../data/reimplemented_2018/train/derby_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/derby_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for derby"

cp ../data/reimplemented_2018/train/lucene-solr_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/lucene-solr_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_lucene-solr.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_lucene-solr.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for lucene-solr"

cp ../data/reimplemented_2018/train/tomcat_B_features.csv ../data/current/train
cp ../data/reimplemented_2018_dedup/test/tomcat_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_2018_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_2018_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated 2018 results for tomcat"

## Manually annotated data results

cp ../data/reimplemented_2016_manual/train/ant_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/ant_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_ant.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_ant.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for ant"

cp ../data/reimplemented_2016_manual/train/cassandra_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/cassandra_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_cassandra.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_cassandra.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for cassandra"

cp ../data/reimplemented_2016_manual/train/commons_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/commons_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_commons.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_commons.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for commons"

cp ../data/reimplemented_2016_manual/train/derby_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/derby_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_derby.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_derby.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for derby"

cp ../data/reimplemented_2016_manual/train/jmeter_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/jmeter_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_jmeter.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_jmeter.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for jmeter"

cp ../data/reimplemented_2016_manual/train/lucene-solr_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/lucene-solr_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_lucene-solr.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_lucene-solr.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for lucene-solr"

cp ../data/reimplemented_2016_manual/train/maven_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/maven_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_maven.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_maven.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for maven"

cp ../data/reimplemented_2016_manual/train/tomcat_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/tomcat_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results for tomcat"

cp ../data/reimplemented_2016_manual/train/*_features.csv ../data/current/train
cp ../data/reimplemented_2016_manual/test/*_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7a.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7a.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated manually annotated data results"

## New dataset of projects that configured FindBugs

cp ../data/has_filter/train/flink_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/flink_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_flink.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_flink.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for flink"

cp ../data/has_filter/train/hadoop_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/hadoop_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_hadoop.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_hadoop.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for hadoop"

cp ../data/has_filter/train/jenkins_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/jenkins_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_jenkins.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_jenkins.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for jenkins"

cp ../data/has_filter/train/kudu_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/kudu_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_kudu.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_kudu.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for kudu"

cp ../data/has_filter/train/kafka_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/kafka_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_kafka.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_kafka.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for kafka"

cp ../data/has_filter/train/morphia_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/morphia_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_morphia.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_morphia.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for morphia"

cp ../data/has_filter/train/undertow_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/undertow_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_undertow.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_undertow.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for undertow"

cp ../data/has_filter/train/xmlgraphics-fop_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/xmlgraphics-fop_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_xmlgraphics-fop.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_xmlgraphics-fop.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for xmlgraphics-fop"

cp ../data/has_filter/train/zookeeper_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/zookeeper_C_features.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7b_zookeeper.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7b_zookeeper.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated projects that configured FindBugs results for zookeeper"

## Without unconfirmed false alarms

cp ../data/reimplemented_2016/train/tomcat_B_features.csv ../data/current/train
cp ../data/reimplemented_2016_dev_confirmed/tomcat_totalFeatures_with_dev_confirmed_labels.csv  ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_tomcat.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_tomcat.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for tomcat"

cp ../data/has_filter/train/flink_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/flink_C_features_with_dev_confirmed_labels.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_flink.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_flink.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for flink"

cp ../data/has_filter/train/kafka_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/kafka_C_features_with_dev_confirmed_labels.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_kafka.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_kafka.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for kafka"

cp ../data/has_filter/train/kudu_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/kudu_C_features_with_dev_confirmed_labels.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_kudu.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_kudu.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for kudu"

cp ../data/has_filter/train/xmlgraphics-fop_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/xmlgraphics-fop_C_features_with_dev_confirmed_labels.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_xmlgraphics-fop.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_xmlgraphics-fop.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for xmlgraphics-fop"

cp ../data/has_filter/train/jenkins_B_features.csv ../data/current/train
cp ../data/has_filter_dedup/test/jenkins_C_features_with_dev_confirmed_labels.csv ../data/current/test
python3 baseline.py &> ../logs/baseline_table7c_jenkins.log
DUMMY=constant python3 baseline.py &> ../logs/dummy_table7c_jenkins.log
rm -f ../data/current/train/* 
rm -f ../data/current/test/*

echo "Generated results without unconfirmed false alarms for jenkins"

# Tables

mkdir ../tables
python3 generate_tables.py

echo "Generated tables"
