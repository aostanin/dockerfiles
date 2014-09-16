# docker-crashplan

## Description

A Dockerfile for [CrashPlan](http://www.code42.com/crashplan/).

## Volumes

### `/data`

`/data` contains CrashPlan configuration data.

### `/backups`

`/backups` contains local backups.

## Ports

### 4242

Backup service.

### 4243

UI service.

## Environment Variables

### `MAX_MEMORY_MB`

The maximum memory limit in megabytes. Defaults to `1024`. Code42 [recommends](http://support.code42.com/CrashPlan/Latest/Troubleshooting/CrashPlan_Runs_Out_Of_Memory_And_Crashes) allocating 1 GB per 1 TB of storage.

