[![Version](https://img.shields.io/cocoapods/v/Critizr.svg?style=flat)](http://cocoapods.org/pods/Critizr)
[![License](https://img.shields.io/cocoapods/l/Critizr.svg?style=flat)](http://cocoapods.org/pods/Critizr)
[![Platform](https://img.shields.io/cocoapods/p/Critizr.svg?style=flat)](http://cocoapods.org/pods/Critizr)

Le SDK iOS vous permet :

- D'ouvrir une [interface d'envoi de feedbacks](web_interface_send_feedback.html) pour un point de vente donné
- D'ouvrir une [interface Store Locator](web_interface_store_locator.html)
- D'obtenir la note de relation client d'un point de vente

## Installation

### Manuellement
- [**Téléchargez le SDK**](https://github.com/critizr/critizr-ios-sdk/archive/master.zip).
- **Glissez déposez** le fichier `Critizr.framework` dans votre projet XCode. Une boîte de dialogue apparaîtra : assurez-vous de bien cocher les targets sur lesquelles vous souhaitez utiliser le framework.
- **Importez le fichier headers** `Critizr.h` avant d'appeler des méthodes sur le SDK :

### Cocoapods

{% highlight ruby %}
pod 'Critizr'
{% endhighlight %}

{% highlight objective-c %}#import <Critizr/Critizr.h>{% endhighlight %}

## Captures d'écran
<ul class="czd-gallery">
    {% include thumbnail.html url="/images/ios_sdk.png" title="SDK iOS"%}
</ul>

## Démo
Vous trouverez dans le dossier `sample`, une application illustrant les différents cas d'utilisations du SDK.

## Exemple d'utilisation

{% highlight objective-c %}

#import <Critizr/Critizr.h>

// Lancer une modale d'envoi de feedbacks sur le point de vente "32d":
CRFeedbackDialog critizrDialog = [CRFeedbackDialog feedbackDialogWithAPIKey:CRITIZR_API_KEY];
[critizrDialog presentFeedbackDialogFrom:self withStoreIdString:@"32d"];


{% endhighlight %}

## Référence

### CRFeedbackDialog / CRFeedbackDialogDelegate : lancer des interfaces

#### CRFeedbackDialog

#### `+ (CRFeedbackDialog *) feedbackDialogWithAPIKey: (NSString *)apiKey`
Retourne une instance de `CRFeedbackDialog` que vous pourrez utiliser pour lancer des interfaces Critizr.

{% highlight objective-c %}[CRFeedbackDialog feedbackDialogWithAPIKey:CRITIZR_API_KEY];{% endhighlight %}

#### `- (void) presentFeedbackDialogFrom: (UIViewController *)viewController`
Lance l'[interface Store Locator](web_interface_store_locator.html) sous forme de modale, à l'aide du `UIViewController` indiqué.
L'utilisateur sera donc invité à choisir le point de vente auquel envoyer ses feedbacks.

{% highlight objective-c %}[myDialog presentFeedbackDialogFrom:self];{% endhighlight %}

*Note: Il n'est pas encore possible de passer des paramètres aux interfaces lancées par le SDK iOS.*

#### `- (void) presentFeedbackDialogFrom:(UIViewController *)viewController WithStoreId:(int)storeId`
Lance l'[interface Envoi de Feedback](web_interface_send_feedback.html) sous forme de modale, à l'aide du `UIViewController` indiqué, pour le point de vente `storeId`.

{% highlight objective-c %}[myDialog presentFeedbackDialogFrom:self WithStoreId:12];{% endhighlight %}

*Note: Il n'est pas encore possible de passer des paramètres aux interfaces lancées par le SDK iOS.*


#### `- (void) presentFeedbackDialogFrom:(UIViewController *)viewController WithStoreIdString:(NSString *)storeId`

Lance l'[interface Envoi de Feedback](web_interface_send_feedback.html) sous forme de modale, à l'aide du `UIViewController` indiqué, pour le point de vente `storeId`.

{% highlight objective-c %}[myDialog presentFeedbackDialogFrom:self WithStoreId:@"12ae2"];{% endhighlight %}

*Note: Il n'est pas encore possible de passer des paramètres aux interfaces lancées par le SDK iOS.*

#### CRFeedbackDialogDelegate

Votre `UIViewController` peut adhérer au protocole `CRFeedbackDialogDelegate` et ainsi être informé d'évènements concernant vos `CRFeedbackDialog` via l'appel des méthodes suivantes :

#### `- (void) feedbackDialogDidCloseWithMessageSent: (BOOL)messageSent`

Méthode appelée lorsque l'interface d'envoi de feedback s'est terminée.
Si une remarque a été envoyée par l'utilisateur pendant le processus, `messageSent` aura comme valeur `YES`.

### CRSdk / CRSdkDelegate : Récupérer des données

#### CRSDK

#### `+ (CRSdk *) critizrSDKInstanceWithAPIKey: (NSString *)apiKey andDelegate: (id<CRSdkDelegate>)delegate;`
Retourne une instance de `CRSdk` que vous pourrez utiliser pour récupérer des données relatives à Critizr.

{% highlight objective-c %}CRSdk *sdk = [CRSdk critizrSDKInstanceWithAPIKey:CRITIZR_API_KEY andDelegate:self];
{% endhighlight %}

#### `- (void) fetchRatingForPlace:(NSString *)aPlaceId withDelegate:(id<CRSdkDelegate>)aDelegate;`
Permet de récupérer la note de relation client attribuée à un point de vente d'id `aPlaceId`.
Cette méthode est asynchrone : lorsque la note de relation client est récupérée, la méthode `critizrPlaceRatingFetched` du `CRSdkDelegate` est appelée.

{% highlight objective-c %}[mySdk fetchRatingForPlace:@"a239" andDelegate:self];
{% endhighlight %}

#### CRSDKDelegate

Votre `UIViewController` (ou n'importe quelle classe) peut adhérer au protocole `CRSdkDelegate`, pour se voir appeler les méthodes suivantes :

#### `-(void) critizrPlaceRatingFetched:(double)aPlaceRating`

Méthode appelée en réponse à la méthode `fetchRatingForPlace:withDelegate:` de `CRSdk`. `aPlaceRating` correspond donc à la note de relation client du point de vente que vous aviez spécifié.

#### `-(void) critizrPlaceRatingError:(NSError *)anError`

Méthode appelée en réponse à la méthode `fetchRatingForPlace:withDelegate:`, dans le cas où une erreur est survenue.
