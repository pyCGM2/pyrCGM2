# pyrCGM2

**pyrCGM2** est un package R dédié à la manipulation des tableaux de données produits par le package python [pyCGM2](https://pycgm2.netlify.app/).

Ces tableaux de données regroupent les données cinématiques/dynamiques articulaires normalisés, cad dans le cadre de la marche, normalisés selon le cycle de marche. Le but de ce package est d 'offrir des fonctions R intuitives permettant de tracer un paramètre, quantifier une différence.

J ai voulu que les fonctions R soit le plus explicite possible. Il n 'y a pas de programmation objet, de classes a maitriser,... rien qu'une liste de fonctions R accessibles dans le répertoire R.

**Pour ceux qui voudraient avoir un aperçu** , vous pouvez vous rendre dans le répertoire vignettes. J"expose des scenarii concrets d'analyse de marche. Pour faciliter votre compréhension, veuillez débuter par la vignette `pre-requisite-data_fr.Rmd`. Elle vous permettra de bien comprendre comment le tableau de données s'organise.

J'ai déjà éprouvé ce package lors des traitements des données qui m'ont permis de publier, entre autres, les articles :

-   Leboeuf, F.; Sangeux, M. (2022) Wand-mounted lateral markers are less prone to soft-tissue artefacts than skin-mounted markers when using the conventional gait model. In : Gait & posture. DOI: 10.1016/j.gaitpost.2022.12.013.

-   Fouasson-Chailloux, Alban; Leboeuf, Fabien; Maugars, Yves; Trossaert, Marc; Menu, Pierre; Rannou, François et al. (2022) Gait Alteration Due to Haemophilic Arthropathies in Patients with Moderate Haemophilia. In : International journal of environmental research and public health, vol. 19, n° 12. DOI: 10.3390/ijerph19127527.

-   Leboeuf, F.; Reay, J.; Jones, R.; Sangeux, M. (2019) The effect on conventional gait model kinematics and kinetics of hip joint centre equations in adult healthy gait. In : Journal of biomechanics, vol. 87, p. 167--171. DOI: 10.1016/j.jbiomech.2019.02.010.

### Installation

vous pouvez installer le package en tapant :

```{r}
library(devtools)
install_github(pyCGM2/pyrCGM2)
```

## Remarques

Ce package est expérimental et des changements peuvent avoir lieu à l'avenir.

J ai intégré, a ce jour, des fonctions relatifs à une exploitation basiques des données. Il est prévu l'intégration d'autres fonctions permettant entre autre de calculer la variabilité des courbes.

## Rapporter une erreur

pour rapporter une erreur, merci de bien vouloir poster votre question via le manager/suivi des **Issues** de github

## Contact

Ne pas à me contacter : **fabien.leboeuf\@chu-nantes.fr**
