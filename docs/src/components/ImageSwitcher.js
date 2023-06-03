import React from 'react';
import { useColorMode } from '@docusaurus/theme-common';

const ImageSwitcher = ({lightImageSrc, darkImageSrc, alt}) => {
const { isDarkTheme } = useColorMode();

  return (
    <img src={isDarkTheme ? darkImageSrc : lightImageSrc} alt={alt ?? ''} />
  )
}

export default ImageSwitcher;