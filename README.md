# Utrecht University dissertation template

Version 0.4

<!-- For future use: ![Latest release](https://img.shields.io/github/v/release/UtrechtUniversity/UU-dissertation-template?style=flat-square) -->

This is a Utrecht University dissertation template for LaTeX. While it is loosely based on the TU Delft template, it should follow the required content and textual obligations as provided in the doctoral degree regulations and the 'aanwijzingen voor promovendi'. 

It is designed to work with all versions of LaTeX, but if you want to adhere to the UU housestyle (some legacy there), you need add the UU fonts and use XeLaTeX, as it supports TrueType and OpenType fonts. 

We welcome all input and any suggestions or examples using this template.

## Using the template

The document can be compiled with ```latexmk```, alternatively by running:
```sh
pdflatex main
biber references
pdflatex main
pdflatex main
```

Or by selecting the 'pdfLaTeX' and 'Biber' options in your favourite TeX editing program, respectively.

A sample document, as well as documentation for template options, can be found
in main.pdf. 

### Known issues
When you use the template for the first time, you might encounter some of the issues below.

1. Please note: When running the following warning is due to the fancy colouring of the headers. Not sure how to fix this. 

    ```Token not allowed in a PDF string (Unicode): (hyperref) removing `\@ifnextchar'.```
2. pdfLaTeX may not initially succeed, referring to a log file for troubleshooting. This log file may contain a line such as:

   ```The futri8r source file could not be found.```
   
   This means that the font map file was not created or linked, which is needed for the Type1 version of the font. Usually you can resolve this by installing the fonts (if you have not already done so) for your specific distribution (check the installed packages) and then refresh the font map files. This last step may depend on the TeX distribution you are using. For example, in the MiKTeX console, you can do this by clicking "Refresh font map files" in the "Tasks" drop down menu.





## Project organisation

A description of the project organisation is provided below. The required, often included and optional sections are also labeled here (as well as within main.tex). 

As this is an ongoing project, the works in progress (WIP) are explicitly listed. 

```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── dissertation.cls 			<- Class description and general style definition (WIP)
├── stylesheet.tex 			<- Packages and some style definitions (WIP)
├── main.tex 				<- Main .tex document, use this to (de-)activate chapters and parts
├── main.pdf 				<- Compiled disseration
├── fonts                		<- Set of fonts to use within the dissertation
├── FrontMatter         		<- Contains all .tex files for content before the introduction
│   	├── cover.tex   	 		<- Styling of the cover content
│   	├── Cover	  	 		<- Contains cover images
│   	├── title.tex          	 		<- Title page content and styling (required)
│   	├── Logos		 		<- Contains all logos used
│   	├── acronyms.tex 		        <- Definition of acronyms used (often included)
│   	├── hyphenations.tex 		        <- Explicit hyphenation commands for terminology
│   	├── shorthand.tex 		        <- Way to define shorthands for common terms or phrases
│   	└── preface.tex     		        <- Optional opening word (optional)
├── MainMatter             		<- Contains all .tex files for the content from introduction to conclusion
│   	├── introduction.tex     		<- Introduction .tex file (required)
│   	├── contributions.tex     	        <- Overview of contributions .tex file (required, can be part of appendix, see publications.tex)
│   	├── conclusions.tex     		<- Conclusion .tex file (required)
│   	└── paper1				<- Contains the .tex file (paper1-main) and Figures folder (in this case the explanation of the class)
└── BackMatter           		<- Contains all .tex files for content after the conclusion
        ├── epilogue.tex                        <- Epilogue (optional)
        ├── appendix-example.tex   	        <- Example of appendix of a MainMatter paper/chapter
        ├── sikx.tex        		        <- SIKS research school list (required for SIKS members)
        ├── samenvatting.tex        	        <- Dutch samenvatting (required if dissertation in English)
        ├── publications.tex        	        <- Listing method for published works (required)
        ├── acknowledgements.tex	        <- Ackns. or Dankwoord (often included)
        ├── cv.tex        			<- CV or about the author (required)
        └── backcover.tex         	        <- Styling of the back cover content

```


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please [cite this project as described here](/CITATION.md).
