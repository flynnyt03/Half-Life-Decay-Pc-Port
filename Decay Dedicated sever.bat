@echo off
cls
title Decay Dedicated server
start /wait hlds.exe -console -game decay +map dy_accident1 +ip 172.27.176.1 +port 27015 -sport 33015
