require ["envelope", "subaddress", "fileinto", "imap4flags", "regex"];

# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
  discard;
  stop;
}

# Trash messages with improperly formed message IDs
if not header :regex "message-id" ".*@.*\\." {
  #discard;
  addflag "\\Seen";
  fileinto "Junk";
  stop;
}

# File low-level spam in spam bucket, and viruses in Infected folder
if anyof (header :contains "X-Spam-Level" "*****",
          header :contains "X-Virus-Status" "Infected") {
  if header :contains "X-Spam-Level" "*****" {
      fileinto "Junk";
      setflag "\\Seen";

    }
  else {
    fileinto "Infected";

  }

}

if header :contains "X-Spam-Flag" "YES" {
  addflag "\\Seen";
  fileinto "Junk";
  # Stop here - if there are other rules, ignore them for spam messages
  stop;

}

if envelope :matches :detail "to" "spam"{
  fileinto "Junk";
}
