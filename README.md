Navn: Martin Brådalen

Studentnr: 473145

Klasse: 16HBITSECA

# IMT2282 Operativsystemer: Oblig 2 - Programmering i bash.


## Alle bash filer kan kjøres ved å først gi den executable rettigheter.
    chmod +x <filnavn>

## Så kjøre filen med:
    ./<filename>

## Alle filene har blitt kvalitetssikret med:

### syntax sjekk:
    bash -n <filnavn>.bash
    
### shellsheck

#### installeres med:
    sudo apt install shellckeck
#### brukes med:
    shellcheck <filnavn>.bash
    
#### i filen procmi.bash får jeg 4 tilbakemeldinger av spellcheck.
    $/${} is unnecessary on arithmetic variables.
#### [Kildekoden til spellcheck](https://github.com/koalaman/shellcheck) Sier følgende:
    The `$` is unavoidable for special variables like `$1` vs `1'.
#### Og jeg finner ikke noen annen måte å skrive koden på, som gir meg det resultatet jeg ønsker å oppnå.

#### Samme gjelder for de to andre jeg får error på:
    Consider using { cmd1; cmd2; } >> file instead of individual redirects.
#### Det finnes sikkert en bedre metode, men det fungerer.
