#####################
# DNS - Root Domain #
#####################

resource "vultr_dns_domain" "root" {
  domain = local.root_domain
}

##################################
# DNS - Offworld (Reverse Proxy) #
##################################

resource "vultr_dns_record" "nas" {
  domain = vultr_dns_domain.root.id
  name   = "nas"
  type   = "A"
  data   = module.host_offworld.main_ip
  ttl    = 300
}

resource "vultr_dns_record" "status" {
  domain = vultr_dns_domain.root.id
  name   = "status"
  type   = "A"
  data   = module.host_offworld.main_ip
  ttl    = 300
}

resource "vultr_dns_record" "sync" {
  domain = vultr_dns_domain.root.id
  name   = "sync"
  type   = "A"
  data   = module.host_offworld.main_ip
  ttl    = 300
}

######################
# DNS - GitHub Pages #
######################

resource "vultr_dns_record" "gh_ipv4_a" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "A"
  data   = "185.199.108.153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv4_b" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "A"
  data   = "185.199.109.153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv4_c" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "A"
  data   = "185.199.110.153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv4_d" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "A"
  data   = "185.199.111.153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv6_a" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "AAAA"
  data   = "2606:50c0:8000::153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv6_b" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "AAAA"
  data   = "2606:50c0:8001::153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv6_c" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "AAAA"
  data   = "2606:50c0:8002::153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_ipv6_d" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "AAAA"
  data   = "2606:50c0:8003::153"
  ttl    = 300
}

resource "vultr_dns_record" "gh_pages_challenge" {
  domain = vultr_dns_domain.root.id
  name   = "_github-pages-challenge-perpetualpanda"
  type   = "TXT"
  data   = "000dcdf2686daed53910f406c6a20f"
  ttl    = 300
}

####################
# DNS - ProtonMail #
####################

resource "vultr_dns_record" "proton_domainkey1" {
  domain = vultr_dns_domain.root.id
  name   = "protonmail._domainkey"
  type   = "CNAME"
  data   = "protonmail.domainkey.d3wxy5ytci2hzufheo7wcxxinbvkv4cso2g5ddycqj7gqiuta7n2q.domains.proton.ch"
  ttl    = 300
}

resource "vultr_dns_record" "proton_domainkey2" {
  domain = vultr_dns_domain.root.id
  name   = "protonmail2._domainkey"
  type   = "CNAME"
  data   = "protonmail2.domainkey.d3wxy5ytci2hzufheo7wcxxinbvkv4cso2g5ddycqj7gqiuta7n2q.domains.proton.ch"
  ttl    = 300
}

resource "vultr_dns_record" "proton_domainkey3" {
  domain = vultr_dns_domain.root.id
  name   = "protonmail3._domainkey"
  type   = "CNAME"
  data   = "protonmail3.domainkey.d3wxy5ytci2hzufheo7wcxxinbvkv4cso2g5ddycqj7gqiuta7n2q.domains.proton.ch"
  ttl    = 300
}

resource "vultr_dns_record" "proton_mx1" {
  domain   = vultr_dns_domain.root.id
  name     = "@"
  type     = "MX"
  data     = "mail.protonmail.ch"
  priority = 10
  ttl      = 300
}

resource "vultr_dns_record" "proton_mx2" {
  domain   = vultr_dns_domain.root.id
  name     = "@"
  type     = "MX"
  data     = "mailsec.protonmail.ch"
  priority = 20
  ttl      = 300
}

resource "vultr_dns_record" "proton_dmarc" {
  domain = vultr_dns_domain.root.id
  name   = "_dmarc"
  type   = "TXT"
  data   = "v=DMARC1; p=quarantine"
  ttl    = 300
}

resource "vultr_dns_record" "proton_spf" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "TXT"
  data   = "v=spf1 include:_spf.protonmail.ch mx ~all"
  ttl    = 300
}

resource "vultr_dns_record" "proton_verification" {
  domain = vultr_dns_domain.root.id
  name   = "@"
  type   = "TXT"
  data   = "protonmail-verification=b93e1e9a06d1776b86ad3a484de0c2968f25c1ab"
  ttl    = 300
}
