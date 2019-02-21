#!/bin/bash
set -e
service mysql start
mysql < /mysql-db-dump/setup.sql
service mysql stop