exports.foo = async () => {
    return new Promise((resolve) => {
        setTimeout(() => resolve(42), 1200);
    })
};
