import React, { useState } from "react";
import Scanner from "./Scanner";
import styled from "styled-components";

const Index = () => {
  const [camera, setCamera] = useState(true);
  const [result, setResult] = useState(null);

  const onDetected = result => {
    setResult(result);
    setCamera(!camera)
    window.location.href = '/scanners/' + result
  };

  return (
    <section className="section-wrapper">
      <div className="section-title">
        <h1 className="section-title-text">
          {camera ? <Scanner onDetected={onDetected} /> : <p>読み込み中...</p> }
        </h1>
      </div>
    </section>
  );
}

export default Index