define base::user ($state, $home, $gid, $id, $passwd, $managehome = true, $realname, $shell = '/bin/bash', $sgroups, $state, $uid) {
  user { $id:
    comment    => $realname,
    ensure     => $state,
    gid        => $gid,
    groups     => $sgroups,
    home       => $home,
    managehome => $managehome,
    password   => pw_hash($passwd, 'SHA-512', 'mysalt'),  # ToDo - strategy for passwords and salt generation
    shell      => $shell,
    uid        => $uid,
  }
}
