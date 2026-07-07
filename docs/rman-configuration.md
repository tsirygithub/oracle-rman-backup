# Oracle RMAN Configuration

## Overview

This document describes a recommended Oracle Recovery Manager (RMAN) configuration for enterprise environments.

The objective is to ensure consistent backups, efficient recovery and compliance with backup retention policies.

---

# RMAN Configuration

Display the current RMAN configuration.

```rman
SHOW ALL;
```

Example configuration:

```rman
CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 14 DAYS;

CONFIGURE BACKUP OPTIMIZATION ON;

CONFIGURE CONTROLFILE AUTOBACKUP ON;

CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '/backup/controlfile/%F';

CONFIGURE DEVICE TYPE DISK PARALLELISM 2 BACKUP TYPE TO COMPRESSED BACKUPSET;

CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT '/backup/rman/%d_%T_%U.bkp';

CONFIGURE COMPRESSION ALGORITHM 'MEDIUM';

CONFIGURE ARCHIVELOG DELETION POLICY TO BACKED UP 1 TIMES TO DISK;
```

---

## Recommended Directory Structure

```
/backup
│
├── rman
├── archivelog
├── controlfile
├── spfile
├── logs
└── scripts
```

---

## Retention Policy

| Backup Type | Frequency | Retention |
|-------------|-----------|-----------|
| Archive Logs | Daily | 14 Days |
| Incremental | Daily | 14 Days |
| Full Backup | Weekly | 8 Weeks |
| Monthly Backup | Monthly | 12 Months |

---

## Compression

RMAN compressed backupsets are recommended to reduce storage usage.

---

## Encryption

When supported:

```rman
CONFIGURE ENCRYPTION FOR DATABASE ON;
```

---

## Validation

Regularly validate backups.

```rman
VALIDATE DATABASE;

VALIDATE ARCHIVELOG ALL;
```

---

## Monitoring

Check RMAN jobs daily.

Review RMAN logs after every backup.

Monitor available disk space.

---

## Best Practices

- Enable CONTROLFILE AUTOBACKUP.
- Use compressed backupsets.
- Validate backups regularly.
- Test restore procedures periodically.
- Store backups on separate storage.
- Replicate critical backups offsite.
