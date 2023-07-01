import { useState, useEffect } from 'react'
import { useTheme } from 'next-themes'
import React from 'react'
import Image from 'next/image'

const useDark = () => {
    const { resolvedTheme } = useTheme()
    const [isDark, setIsDark] = useState(false)
    useEffect(() => {
      setIsDark(resolvedTheme === 'dark')
    }, [resolvedTheme])
    return isDark
  }

const ThemeResponsiveImage = ({ lightSrc, darkSrc, alt, width, height }) => {
  const isDark = useDark();
  return (
    <Image
      src={isDark ? darkSrc : lightSrc}
      alt={alt}
      width={width ?? 100}
      height={height ?? 100} 
      layout={width == null ? "responsive" : ""}
    />
  );
};

export default ThemeResponsiveImage;