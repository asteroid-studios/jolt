import React from 'react';

const ExternalLink = ({ child, href }) => {
  const handleClick = (e) => {
    e.preventDefault();
    window.open(href, '_blank', 'noopener noreferrer');
  };

  return (
    <button onClick={handleClick}>
      {child}
    </button>
  );
};


export default ExternalLink;