#!/bin/bash

printf "#!/bin/bash\n\n"
for dir in $(find vim/bundle/ -name ".git"); do
	printf "git clone %s %s\n" \
		"$(grep '.git$' $dir/config | cut -d= -f2 | sed -e 's?git@github.com:?git://github.com/?')" \
		"$(echo $dir | sed -e 's:/.git::')"
done
