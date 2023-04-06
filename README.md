# Utrecht University dissertation template

Version 0.2.0

This is a Utrecht University dissertation template for LaTeX. While it is based around the TU Delft template, it should follow the required content and textual obligations as provided in the doctoral degree regulations and the 'aanwijzingen voor promovendi'. If any issues are found, please let us know! 

It is designed to work with all versions of LaTeX, but if you want to adhere to the TU Delft house
style, you need to use XeLaTeX, as it supports TrueType and OpenType fonts. 


## Using the template

The document can be compiled with

  pdflatex main
  biber MainMatter/paper1/paper1biblio
  pdflatex main
  pdflatex main

Or by selecting the 'pdfLaTeX' and 'Biber' options in your favorite TeX editing
program, respectively. Note that you have to run bibtex for every chapter.

A sample document, as well as documentation for template options, can be found
in example.pdf. 

## Project organization

```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── dissertation.cls 	<- Class description and general style definition
├── stylesheet.tex 	<- Packages and some style definitions
├── main.tex 		<- Main LaTeX document, use this to (de-)activate chapters and parts
├── main.pdf 		<- Compiled disseration
├── fonts                	<- Set of fonts to use within the dissertation
├── FrontMatter         	<- Contains all .tex files for content before the introduction
│   	├── cover.tex   	 <- Styling of the cover content
│   	├── Cover	  	 <- Contains cover images
│   	├── title.tex          	 <- Title page content and styling
│   	├── Logos		 <- Contains all logos used
│   	├── acronyms.tex <- Definition of acronyms used
│   	└── preface.tex     <- Optional opening word
├── MainMatter             <-  Contains all .tex files for the content from introduction to conclusion
│   	├── manuscript     <-
│   	└── reports        	<- 
└── BackMatter            <-  Contains all .tex files for content after the conclusion
      	├── figures        	<- 
   	└── output         	<- 

```


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please [cite this project as described here](/CITATION.md).
