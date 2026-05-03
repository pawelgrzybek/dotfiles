function optim
	# For this one to run you need to install a few CLIs
	# brew install webp
	# brew install  avifenc
	# brew install imageoptim-cli

	echo 

	for file in $argv
		set filePath (realpath $file)
		set filePathNoExtension (string split -r -m 1 . -- $filePath)[1]
		set filePathWebp $filePathNoExtension.webp
		set filePathAvif $filePathNoExtension.avif

		# webp
		if test -e $filePathWebp
		    echo (set_color blue)i $filePathWebp already exists(set_color normal);
		else
				echo (set_color blue)i Running webp(set_color normal)
				cwebp -quiet $filePath -o $filePathWebp
				echo (set_color green)✓ Finished(set_color normal)
		end

		# avif
		if test -e $filePathAvif
		    echo (set_color blue)i $filePathAvif already exists(set_color normal);
		else
			echo (set_color blue)i Running avif(set_color normal)
      avifenc -q 50 -s 4 $filePath $filePathAvif
			echo (set_color green)✓ Finished(set_color normal)
		end

		# image optim
		imageoptim --no-stats $filePath

		echo ✅ $file \n
	end

end
