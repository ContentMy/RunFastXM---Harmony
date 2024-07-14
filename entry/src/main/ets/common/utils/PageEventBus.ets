export class PageEventBus {
  private static instance: PageEventBus;
  private events: Map<string, Array<(data?: object) => void>> = new Map();

  private constructor() {}

  public static getInstance(): PageEventBus {
    if (!PageEventBus.instance) {
      PageEventBus.instance = new PageEventBus();
    }
    return PageEventBus.instance;
  }

  public subscribe(event: string, callback: (data?: object) => void): void {
    if (!this.events.has(event)) {
      this.events.set(event, []);
    }
    this.events.get(event)?.push(callback);
  }

  public unsubscribe(event: string, callback: (data?: object) => void): void {
    if (!this.events.has(event)) return;
    const callbacks = this.events.get(event);
    if (callbacks) {
      this.events.set(event, callbacks.filter(cb => cb !== callback));
    }
  }

  public publish(event: string, data?: object): void {
    if (!this.events.has(event)) return;
    const callbacks = this.events.get(event);
    if (callbacks) {
      callbacks.forEach(callback => callback(data));
    }
  }
}
