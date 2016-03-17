'use strict';

import React, {
  StyleSheet, // 样式
  PixelRatio,
  TabBarIOS,
  View
} from 'react-native';

import News from '../component/News';
import User from '../component/User';
export default class TabIndex extends React.Component{

    constructor(props) {
      super(props);
      this.state = {
         tabIndex:0,
      };
    }

    _renderScene() {
        switch(this.state.tabIndex) {
            case 0:
                return <News pnav={this.props.pnav} starDatas={this.props.starDatas} />;
                break;
            case 1:
                return <User pnav={this.props.pnav} starDatas={this.props.starDatas} />;
                break;
        }
    }

    render() {
        return (
            <View style={styles.container}>
                <TabBarIOS translucent={true} >

                        <TabBarIOS.Item
                                      title={'资讯'}
                                      selected={this.state.tabIndex === 0}
                                      icon={require('../image/ios7-world-outline.png')}
                                      key={0}
                                      selectedIcon={require('../image/ios7-world.png')}

                                      onPress={() => {
                                        this.setState({ tabIndex: 0,});
                                      }}>
                                      {this._renderScene()}
                        </TabBarIOS.Item>

                        <TabBarIOS.Item
                                    title={'收藏'}
                                    selected={this.state.tabIndex === 1}
                                    icon={require('../image/ios7-star-outline.png')}
                                    key={1}
                                    selectedIcon={require('../image/ios7-star.png')}

                                    onPress={() => {
                                      this.setState({ tabIndex: 1,});
                                    }}>
                                    {this._renderScene()}
                      </TabBarIOS.Item>

                </TabBarIOS>
            </View>
        );
    }
};

var styles = StyleSheet.create({
    container: {
      flex: 1,
      marginBottom:0
    },
});
