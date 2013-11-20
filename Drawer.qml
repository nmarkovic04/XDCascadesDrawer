/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import mytimer.library 1.0

Container {
        property int begin: 0 
        property int end: 640
        property int minValue: 320 
        property int snapAnimationDuration: 600
        property int initialTranslationX: -1
        property int initialTranslationY: -1

        id: containerRoot
        
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        
        layout: DockLayout {}
       
        animations: [
            TranslateTransition {
                id: dragTransition
                easingCurve: StockCurve.Linear
            }
        ] 
        
        SwipeHandler {
            id: swipeHandler
            
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill
          
            onScrollingStart: {
                if(eventX >= containerRoot.translationX){
                    dragTransition.stop() // stop previous transitions
                    initialTranslationX= containerRoot.translationX // save initial translation
                }
            }
            
            onDrag: {
                if(initialTranslationX != -1){ 
                    if(initialTranslationX - dragOffset < begin ){ // limit scrolling to bounds
                        dragOffset= initialTranslationX-begin
                    }else if(initialTranslationX - dragOffset > end){ // limit scrolling to bounds
                        dragOffset= initialTranslationX-end
                    }
                    	
                    dragTransition.toX= initialTranslationX - dragOffset
                    dragTransition.duration= 1
                    
                    if(!dragTransition.isPlaying())
                    	dragTransition.play()
                }
                
            }
            
            onDragScrollingEnd: {
                if(initialTranslationX!= -1){
                    var sp= 1000/(currentTime-lastTime)*(dragOffset-lastDragOffset) // calculate speed based on finger movement 
                    timerAnimation.speed= sp
                    timerAnimation.start()
                }
                
                initialTranslationX= -1; 
            }
        }
     
        // make sure to 'import mytimer.library 1.0' at the top of the file; also you'll need this in your code: 'qmlRegisterType<QTimer>("mytimer.library", 1, 0, "QTimer");'
    
        attachedObjects: [
            QTimer {
                id: timerAnimation
                interval: 16
                property int speed
                onTimeout: {
                    // speed sign defines a direction
                    
                    if(speed<0){
	                    if(containerRoot.translationX - speed > end){
                            containerRoot.translationX= end
	                    	timerAnimation.stop()
	                    }else 
                            containerRoot.translationX-= speed
                    }else{
                        if(containerRoot.translationX - speed < begin){
                            containerRoot.translationX= begin
                            timerAnimation.stop()
                        }else 
                            containerRoot.translationX-= speed 
                    }
                }
            }
        ] 
          
        
    }
//}


