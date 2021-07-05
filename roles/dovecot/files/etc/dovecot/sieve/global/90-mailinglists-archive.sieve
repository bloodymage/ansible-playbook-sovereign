require [ "regex", "variables", "fileinto", "envelope", "mailbox", "imap4flags" ];

if exists "list-id" {
  if anyof (
            header :regex "list-id" "<([a-z_0-9-]+)[.@]",
            header :regex "list-id" "^\\s*<?([a-z_0-9-]+)[.@]"
            )
             {
             set :lower :upperfirst "listname" "${1}";
             fileinto :create "Archive/Mailing Lists/${listname}";
               stop;
             }
          }


# Listar and mailman like
elsif exists "x-list-id" {
  if header :regex "x-list-id" "<([a-z_0-9-]+)\\\\." {
    set :lower "listname" "${1}";
    fileinto :create "Archive/Mailing Lists/${listname}";
      stop;
    }
}

# Ezmlm
elsif exists "mailing-list" {
  if header :regex "mailing-list" "([a-z_0-9-]+)@" {
    set :lower "listname" "${1}";
    fileinto :create "Archive/Mailing Lists/${listname}";
      stop;
    }
}

# York lists service
elsif exists "x-mailing-list" {
  if header :regex "x-mailing-list" "^\\s*([a-z_0-9-]+)@?" {
    set :lower "listname" "${1}";
    fileinto :create "Archive/Mailing Lists/${listname}";
      stop;
    }
}

# Smartlist
elsif exists "x-loop" {
  if header :regex "x-loop" "^\\s*(a-z_0-9-]+)@?" {
    set :lower "listname" "${1}";
    fileinto :create "Archive/Mailing Lists/${listname}";
      stop;
    }
}

# poorly identified
elsif envelope :contains "from" "owner-" {
  if anyof (
            envelope :regex "from" "owner-([a-z_0-9-]+)-outgoing@",
            envelope :regex "from" "owner-([a-z_0-9-]+)@",
            header :regex "Sender" "owner-([a-z_0-9-]+)@"
            )
             {
             set :lower "listname" "${1}";
             fileinto :create "Archive/Mailing Lists/${listname}";
               stop;
             }
}

# other poorly identified
elsif  envelope :contains "from" "-request" {
  if envelope :regex "from" "([a-z_0-9-]+)-request@" {
    set :lower "listname" "${1}";
    fileinto :create "Archive/Mailing Lists/${listname}";
  stop;
    }
}
