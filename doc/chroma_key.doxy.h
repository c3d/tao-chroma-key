/**
 * @~english
 * @taomoduledescription{ChromaKey, Chroma Key Compositing}
 *
 * The chroma key effect is typically used to remove the background of a
 * picture or a video. It works by making transparent all the pixels that
 * are of a given color, or similar to that color. Here is an example.
 *
 * @~french
 * @taomoduledescription{ChromaKey, Effet d'incrustation (chroma key)}
 *
 * Rend certains pixels d'une texture transparents en fonction de leur couleur 
 *
 * Le filtre <em>chroma key</em> permet de réaliser des effets d'incrustation
 * en rendant transparents les pixels qui ont une couleur donnée, ou une
 * couleur similaire. Voici un exemple.

 * @~
 * @code
import ChromaKey

clear_color 0, 0, 0, 1

color "white"
texture "clouds.jpg"

rectangle -150, 0, texture_width, texture_height

chroma_key 215, 0.5, 0.5, 0, 0.1, 0.1, 0.31, 10
rectangle  150, 0, texture_width, texture_height
 * @endcode
 *
 * @~english
 * @image html chromakey_example.jpg "The blue sky is removed"
 *
 * This module contains shader code from the
 * <a href="http://www.libavg.de/">libavg</a> library. libavg is
 * released under the  GNU Lesser General Public Licence (LGPL).
 * In compliance with this licence, the source code for the ChromaKey module
 * is available here: http://gitorious.org/tao-presentation-modules/chroma_key
 *
 * @endtaomoduledescription{ChromaKey}
 *
 * @~french
 * @image html chromakey_example.jpg "Le bleu du ciel est supprimé"
 *
 * Ce module contient du code <em>shader</em> provenant de la bibliothèque
 * <a href="http://www.libavg.de/">libavg</a>.
 * En accord avec la licence GNU Lesser General Public Licence (LGPL)
 * du code libavg utilisé par ce module, le code source du module
 * est disponible ici: http://gitorious.org/tao-presentation-modules/chroma_key
 *
 * @endtaomoduledescription{ChromaKey}
 *
 * @~
 * @{
 */

/**
 * @~english
 * Activates a chroma key filter on the current texture.
 * The key color is specified by its HSL components (hue, saturation,
 * lightness). @p H is between 0 and 360.0 while @p S and @p L are
 * between 0.0 and 1.0. @n
 * @p HTolerance, @p STolerance and @p LTolerance are the hue, saturation
 * and lightness tolerance, respectively. Values should be between 0.0 and
 * 1.0.@n
 * When @p Softness is > 0, the pixels with a color close to the key
 * color are made partially transparent. Larger values increase effect. @n
 * When @p SpillThreshold is > 0, the pixels that are close to the key color
 * are desaturated so that the key color does not leave a visible tint. Larger
 * values cause more desaturation.
 *
 * @~french
 * Active un filtre "chroma key" sur la texture courante
 * La couleur à éliminer est définie dans l'espace HSL (teinte,
 * saturation, luminosité). @p H est compris entre 0.0. et 360.0, tandis que
 * @p S et @p L sont compris entre 0.0 et 1.0. @n
 * @p HTolerance, @p STolerance et @p LTolerance sont les tolérances sur la
 * teinte, la saturation et la luminosité, respectivement. Elles sont comprises
 * entre 0.0 et 1.0.@n
 * Lorsque @p Softness est > 0, les pixels d'une couleur proche de la couleur
 * à éliminer sont rendus partiellement transparents. Plus la valeur de ce
 * paramètre est grande, plus l'effet est marqué. @n
 * Lorsque @p SpillThreshold est > 0, les pixels dont la couleur est proche de
 * la couleur à éliminer sont désaturés, de manière à éliminer tout reflet.
 * Plus la valeur de @p SpillThreshold est importante, plus la désaturation
 * l'est également.
 */
chroma_key(H:real, S:real, L:real, HTolerance:real, STolerance:real, LTolerance:real,
           Softness:real, SpillThreshold:real);

/**
 * @}
 */
