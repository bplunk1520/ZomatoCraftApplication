<?php
namespace modules\zomatomodule;

use Craft;

class ZomatoModule extends \yii\base\Module
{
    public function init()
    {
        // Define a custom alias named after the namespace
        Craft::setAlias('@modules/zomatomodule', __DIR__);

        // Set the controllerNamespace based on whether this is a console or web request
        if (Craft::$app->getRequest()->getIsConsoleRequest()) {
            $this->controllerNamespace = 'modules\\zomatomodule\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\zomatomodule\\controllers';
        }

        parent::init();

        Craft::$app->view->hook('restaurants-hook', function(array &$context) {

            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://developers.zomato.com/api/v2.1/search?count=20&entity_id=259&entity_type=city",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                "user-key: 23e997888a58d6afaa68123f5e1f1b8d",
            ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);
            $data = json_decode($response, true);

            $list = "";

            foreach($data['restaurants'] as $restaurant){
                $name = $restaurant['restaurant']['name'];
                $list = $list . "$name <br>";
            }


            return $list;
        });
       
    }
}