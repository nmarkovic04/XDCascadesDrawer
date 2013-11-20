/* Copyright (c) 2012 Research In Motion Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
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

Container {
    id: swipeHandler
    property double dragOffset: 0
    property double lastDragOffset: 0
    property double touchDownX
    property variant lastTime
    property variant currentTime
    
    signal scrollingStart(int eventX, int eventY)
    signal momentumScrollingEnd(int eventX, int eventY)
    signal dragScrollingEnd(int eventX, int eventY)
    signal drag(int eventX, int eventY)
    onTouch: {
        
        if (event.isDown()) {
            scrollingStart(event.windowX, event.windowY);
            touchDownX = event.windowX;
            
            lastTime= 0
            currentTime= 0
            lastDragOffset= 0
            dragOffset = 0
            
        } else if (event.isMove()) {
            lastDragOffset= dragOffset
            lastTime= Date.now()
            dragOffset = touchDownX - event.windowX
            drag(event.windowX, event.windowY)
        } else if (event.isUp() || event.isCancel()) {
            currentTime= Date.now()
            lastDragOffset= dragOffset
            dragOffset = touchDownX - event.windowX
            dragScrollingEnd(event.windowX, event.windowY);
        }
    }
   
}