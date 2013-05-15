@echo off
rem ----------------------------------------------------------
rem 本批处理供在windows下使用,快速生成和部署
rem 如果不能正常部署，重新运行rake setup_github_pages后再试试
rem 如果还是不能,chcp 65001试试
rem ----------------------------------------------------------
chcp 65001
rake generate & rake deploy
