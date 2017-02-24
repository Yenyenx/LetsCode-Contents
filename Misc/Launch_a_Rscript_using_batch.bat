@echo off

REM Temporary system path at cmd startup
SET PATH=%PATH%;"C:\Program Files\R\R-3.1.3\bin"

REM R source file
SET RSOURCE="YOUR RSOURCE FOLDER"

REM run the R script called HelloWorld.R stored in your %RSOURCE% folder.
Rscript %RSOURCE%\HelloWorld.R

pause

