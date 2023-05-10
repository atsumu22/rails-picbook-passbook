import React, { useState } from "react";
import Scanner from "./Scanner";
import styled from "styled-components";
import BookCard from "../cards/BookCard";

const Index = () => {
  const [camera, setCamera] = useState(true);
  const [result, setResult] = useState(null);

  const onDetected = result => {
    setResult(result);
    setCamera(!camera)
    // window.location.href = 'https://api.openbd.jp/v1/get?isbn='; + result
  };

  return (
    <section className="section-wrapper">
      <div className="section-title">
        <h1 className="section-title-text">
          {camera ? <Scanner onDetected={onDetected} /> : <p>この本でしょうか...？</p> }
        </h1>
        <div>
          {result && <BookCard result={result} />}
        </div>
      </div>
    </section>
  );
}

export default Index
