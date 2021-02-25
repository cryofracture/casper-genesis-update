# CasperLabs Network Genesis Timestamp Update

I put this script together as a quickly coded out way to monitor and update casper-client genesis timestamp found in /etc/casper/1_0_0/chainspec.toml.

```bash
cryo@cryo-VirtualBox:/etc/casper/1_0_0$ bash ~/projects/casper_network/genesis-date/genesis_date_update.sh update
This basic script generates a timestamp 5 minutes in the future for updating the genesis timestamp of a standalone/self-networked node of casper-client.
Usage:  genesis_date_update.sh genesis OR echo
  genesis_date_update.sh genesis
  genesis_date_update.sh echo
  genesis   Update /etc/casper/1_0_0/chainspec.toml genesis timestamp.
  echo      Just echo the timestamps for comparison.
```

# GENESIS - your highway to re-updating your node's configured timestamp for quickly recovering a test node.

# ECHO - Monitor the time with this command so you can keep a close eye on the start of the block genesis.