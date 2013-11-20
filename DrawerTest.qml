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

Page {
    Container {
        layout: DockLayout {
            
        }
        Label {
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Left
            preferredWidth: 350
            preferredHeight: 150
            id: labelBG
            text: 'BackgroundLabel'
        }
        
        Drawer {
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill
            layout: DockLayout {}
            background: Color.create(1, 1, 0, 1)
            
            
            Label {
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Left
                preferredWidth: 350
                preferredHeight: 150
                id: labelStatus
                text: 'ForegroundLabel'
            }   
        }      
    }
        
}
