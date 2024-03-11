export fq=$(az network public-ip show -g showtech -n public | jq -r '.ipAddress')
echo "${fq}"
knife bootstrap adminuser@$fq --node-name aks --ssh-identity-file ~/.ssh/id_rsa --yes --sudo
rsync -zavuh -e ssh ./cookbooks adminuser@$fq:~
ssh adminuser@$fq -i ~/.ssh/id_rsa "sudo chef-client -zr 'recipe[aks]'"
