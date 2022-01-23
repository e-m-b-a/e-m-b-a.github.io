#!/usr/local/bin/bash

# wiki importer 

wiki_pages_path="/content/wiki"

if [[ ! -d ./wiki ]] ; then
  mkdir ./wiki
fi

cd ./wiki
wiki_instances=("emba" "embark")
for w_instance in "${wiki_instances[@]}" ; do
  if [[ ! -d ./$w_instance.wiki ]] ; then
    git clone https://github.com/e-m-b-a/$w_instance.wiki.git
  fi
  cd ./$w_instance.wiki
  git pull
  
  readarray -t menu_array < ./_Sidebar.md
  for menu_entry in "${menu_array[@]}"; do
    echo "$menu_entry" | rev | cut -d")" -f2- | rev | cut -d"(" -f2-
  done
  
  readarray -t file_array < <(find . -type f \( -iname "*.md" ! -iname "_*" \))
  #echo "${file_array[@]}"
  new_file_path="../..""$wiki_pages_path""/""$w_instance"
  for f_entry in "${file_array[@]}"; do
    #[Back to wiki menu]({{< ref \"/wiki/$w_instance\" >}} "wiki menu")
    header_string="---\ntitle: ""$(basename "$f_entry")""\ndraft: false\n---\n"
    back_link="\n\n[Back to wiki menu]({{< ref \"/wiki/$w_instance\" >}} \"wiki menu\")\n"
    tmpfile_top="./tmp_top_""$w_instance""_""$(basename $f_entry)"
    tmpfile_bottom="./tmp_bottom_""$w_instance""_""$(basename $f_entry)"
    
    echo -e "$header_string""$back_link" > "$tmpfile_top"
    echo -e "$back_link" > "$tmpfile_bottom"
    
    cat "$tmpfile_top" "$f_entry" "$tmpfile_bottom" > "$new_file_path""/""$(basename "$f_entry")"
    rm "$tmpfile_top"
    rm "$tmpfile_bottom"
    
  done
  cd ..
  pwd
done

