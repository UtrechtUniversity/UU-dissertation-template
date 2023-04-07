# Utrecht University dissertation template

Version 0.2.1

This is a Utrecht University dissertation template for LaTeX put together by Laurens Stoop. While it is based around the TU Delft template, it should follow the required content and textual obligations as provided in the doctoral degree regulations and the 'aanwijzingen voor promovendi'. 

It is designed to work with all versions of LaTeX, but if you want to adhere to the TU Delft housestyle, you need to use XeLaTeX, as it supports TrueType and OpenType fonts. 

We welcome all input and any suggestions or examples using this template.

## Using the template

The document can be compiled with

  pdflatex main
  biber MainMatter/paper1/paper1biblio
  pdflatex main
  pdflatex main

Or by selecting the 'pdfLaTeX' and 'Biber' options in your favourite TeX editing program, respectively. Note that you have to run biber for every chapter.

A sample document, as well as documentation for template options, can be found
in main.pdf. 

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
├── fonts                			<- Set of fonts to use within the dissertation
├── FrontMatter         			<- Contains all .tex files for content before the introduction
│   	├── cover.tex   	 		<- Styling of the cover content
│   	├── Cover	  	 		<- Contains cover images
│   	├── title.tex          	 		<- Title page content and styling (required)
│   	├── Logos		 		<- Contains all logos used
│   	├── acronyms.tex 		<- Definition of acronyms used (often included)
│   	└── preface.tex     		<- Optional opening word (optional)
├── MainMatter             		<- Contains all .tex files for the content from introduction to conclusion
│   	├── introduction.tex     		<- Introduction .tex file (required)
│   	├── conclusions.tex     		<- Conclusion .tex file (required)
│   	└── paper1				<- Contains the .tex and .bib file (paper1-main) and Figures folder
└── BackMatter           			<- Contains all .tex files for content after the conclusion
      	├── epilogue.tex        		<- Epilogue (optional)
      	├── appendix-example.tex   	<- Example of appendix of a MainMatter paper/chapter
      	├── summary.tex        		<- English summary (often included)
      	├── samenvatting.tex        	<- Dutch samenvatting (required)
      	├── publications.tex        	<- Listing method for published works (required, can be part of introduction)
      	├── acknowledgements.tex	<- Ackns. or Dankwoord (often included)
      	├── cv.tex        			<- CV or about the author (required)
   	└── backcover.tex         	<- Styling of the back cover content

```


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please [cite this project as described here](/CITATION.md).
