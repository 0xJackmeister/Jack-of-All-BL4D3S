#!/usr/bin/bash

echo """\033[31m      
               ____  _____  ____ ___  _   _    _         _        
              |  _ \|___ / / ___/ _ \| \ | |  / \  _   _| |_ ___  
              | |_) | |_ \| |  | | | |  \| | / _ \| | | | __/ _ \ 
              |  _ < ___) | |__| |_| | |\  |/ ___ \ |_| | || (_) |
              |_| \_\____/ \____\___/|_| \_/_/   \_\__,_|\__\___/ 
\033[0m"""
echo "Version: 0.1"
echo ""
echo "Automating Recon process using subfinder, dirsearch, MassDNS, Sublist3r and more"
echo ""
echo "Author : Jackmeister"
echo ""
echo ""

# Function to validate input
validate_input() {
  # Check if input is empty
  if [ -z "$1" ]; then
    echo "Error: No input provided"
    return 1
  fi

  # Check if input is a valid domain
  if ! [[ "$1" =~ ^[a-zA-Z0-9][a-zA-Z0-9-]*\.[a-zA-Z]{2,}$ ]]; then
    echo "Error: Invalid domain provided"
    return 1
  fi

  # Input is valid
  return 0
}

# Prompt user for input
read -p "Enter target domain: " target

# Validate input
validate_input "$target"
input_valid=$?

# If input is invalid, prompt user to enter again
while [ $input_valid -ne 0 ]; do
  read -p "Enter target domain: " target
  validate_input "$target"
  input_valid=$?
done

# Run subfinder to find subdomains
subfinder -d $target -o subdomains.txt

# Run dirsearch to find directories and files on the target
dirsearch -u $target -e * -t 50 -w wordlists/common.txt -x 400,403,401,429 -F -r -f -o dirsearch_output.txt

# Run MassDNS to resolve subdomains to IP addresses
cat subdomains.txt | massdns -r resolvers.txt -t A -o S -w massdns_output.txt

# Run Sublist3r to find additional subdomains
sublist3r -d $target -o sublist3r_output.txt

# Run FFuF to find forms on the target
ffuf -u $target/FUZZ -w wordlists/common.txt -u $target/FUZZ/FUZ2Z -recursion -t 50 -o fuf_output.txt

# Run WayBackUrls to find historical URLs on the target
waybackurls $target | tee waybackurls_output.txt

# Run nmap to scan the target for open ports and services
nmap -sV -sC -oA nmap_output $target

# Run vulners to find vulnerabilities in the target's software
vulners -sV -oA vulners_output $target

# Run GetJS to find and download JavaScript files from the target
getjs -u $target -o getjs_output

# Run getallurls to find URLs on the target
getallurls $target | tee getallurls_output.txt

# Run XSSHunter to find XSS vulnerabilities on the target
xsshunter -u $target -o xsshunter_output.txt

# Run SQLMap to find SQL injection vulnerabilities on the target
sqlmap -u $target --dbs --threads 5 -o sqlmap_output.txt

# Run XXElnjector to find XXE vulnerabilities on the target
xxeinjector -u $target -o xxeinjector_output.txt

# Run SSRFDetector to find SSRF vulnerabilities on the target
ssrfdetector -
